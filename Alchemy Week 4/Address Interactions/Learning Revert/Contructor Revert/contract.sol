// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address owner;
    constructor () payable{
        require(msg.value >= 1e18,"Should deposit 1ETH");
        owner = msg.sender; 
    }
    function withdraw() external{
        require(msg.sender == owner, "Only");
        (bool success, ) = msg.sender.call{
            value: address(this).balance}("");
            require(success); 
    }
}
    
