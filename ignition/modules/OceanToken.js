const { buildModule } = require('@nomicfoundation/hardhat-ignition/modules')

// module.exports = buildModule("Apollo", (m) => {
//   const apollo = m.contract("Rocket", ["Saturn V"]);

//   m.call(apollo, "launch", []);

//   return { apollo };
// });

module.exports = buildModule('OceanToken', (moduleBuilder) => {
    oceanContract = moduleBuilder.contract('OceanToken', ['0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266', 10000000])

    // moduleBuilder.call(oceanContract, '', [])

    return { oceanContract }
})
