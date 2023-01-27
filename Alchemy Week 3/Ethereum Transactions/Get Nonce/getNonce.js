const provider = require('./provider');

async function getNonce(address) {
    const response = await provider.send({
        jsonrpc: "2.0",
        id: 1,
        method: "eth_getBlockByNumber", // <-- fill in the method
        params: ["latest", true], // <-- fill in the params
    });

    return response.result.transactions.length;
    // return the nonce for the address
}

module.exports = getNonce;
