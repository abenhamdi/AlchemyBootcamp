const { keccak256 } = require("ethereum-cryptography/keccak");
const { utf8ToBytes } = require("ethereum-cryptography/utils");

function hashMessage(message) {

    const messageBytes = utf8ToBytes(message);
    const messagesHash= keccak256(messageBytes);

    return messagesHash;
}

module.exports = hashMessage;
