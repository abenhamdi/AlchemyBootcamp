// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Sidekick {
    function makeContact(address hero) external {
        (bool success, ) = hero.call("take that in your head bitch ");
        require(success);     // TODO: trigger the hero's fallback function!
    }
}
