// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

 

contract Ownable {

    address public collectibleOwner; 
    constructor(){
        collectibleOwner = msg.sender; 
    }
    
    modifier onlyOwner{
        require (msg.sender == collectibleOwner, "You are not the owner Bro :/"); 
        _;
    }
}
contract Transferable is Ownable {
    
    function transfer(address newOwner) external onlyOwner{
        collectibleOwner = newOwner;
    }
} 
