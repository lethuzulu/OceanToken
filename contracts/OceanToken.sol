// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
import "hardhat/console.sol";

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Capped} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

error OceanToken__RewardDepleted(uint256 cap, uint256 totalSupply);

event MintReward(address blockCoinbase, uint256 blockReward);

contract OceanToken is ERC20Capped, Ownable {
    uint256 public blockReward;

    constructor(
        uint256 cap
    ) 
    ERC20("OCEANTOKEN", "OCT") 
    ERC20Capped(cap * (10 ** decimals())) 
    Ownable(msg.sender) {
        resetBlockReward();
        _mint(msg.sender, (cap * 50 / 100) * (10 ** decimals()));
    }

    function mint(address to, uint256 value) external onlyOwner {
        _mint(to, value);
    }

    function burn(address from, uint256 value) external onlyOwner {
        _burn(from, value);
    }

    function resetBlockReward() public {
        uint256 remainingTokens = cap() - totalSupply();
        if (remainingTokens > cap()){
            revert OceanToken__RewardDepleted(cap(), totalSupply());
        }
        blockReward = (remainingTokens * 1/100 );
    }

    function mintMinerReward() internal {
        _mint(block.coinbase, blockReward);
        emit MintReward(block.coinbase, blockReward);
        //reset block reward
        resetBlockReward();
    }


    function _update(address from, address to, uint256 value) internal override {
        if (to != block.coinbase) {
            mintMinerReward();
        }
        ERC20Capped._update(from, to, value);
    }
}
