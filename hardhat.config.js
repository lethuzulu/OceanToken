require('@nomicfoundation/hardhat-toolbox')
require('hardhat-deploy')
require('hardhat-deploy-ethers')

// const SEPOLIA_RPC_URL = process.env.SEPOLIA_RPC_URL
// const PRIVATE_KEY = process.env.PRIVATE_KEY
// const ADMIN_ADDRESS = process.env.DEPLOYER_ADDRESS
// const ADMIN_PRIVATE_KEY = process.env.DEPLOYER_PRIVATE_KEY
// const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY

module.exports = {
    solidity: '0.8.24',
    namedAccounts: {
        deployer: {
            default: 0,
        },
        user1: {
            default: 1,
        },
        user2: {
            default: 2,
        },
    },
}

