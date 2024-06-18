module.exports = async ({
    getNamedAccounts,
    deployments,
}) => {
    const { deploy} = deployments
    const { deployer } = await getNamedAccounts()

    const args = [1000000]
    await deploy('OceanToken', {
        from: deployer,
        args,
        log: true,
    })
}

module.exports.tags = ['all', 'token']
