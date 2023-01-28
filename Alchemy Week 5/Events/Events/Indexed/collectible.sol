// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address _owner;
    uint salePrice; 
    bool isForSale; 
    
    event Deployed (address indexed _owner);
    event Transfer(address indexed _owner, address indexed _newOwner); 
    event ForSale( uint indexed _price, uint indexed timestamp);
    event Purchase(uint indexed _amount, address indexed _buyer);
    
    constructor (){
        _owner = msg.sender;

        salePrice = 0; 
        isForSale = false;
         
        emit Deployed(msg.sender);  
    }

    modifier onlyOwner(){
        require(msg.sender == _owner, "Go make Around! Only owner can transfer Ethers");
        _;
    }

    function transfer( address _receipient) external onlyOwner{ 
       // To know if the current owner is the sender's Eth
       // require(msg.sender == _owner, "Go make Around! Only owner can transfer Ethers");
        _owner = _receipient; 
        emit Transfer(msg.sender, _receipient);
    }
    
    function markPrice(uint _price) external onlyOwner {
        salePrice = _price; 
        isForSale = true;
        emit ForSale(_price, block.timestamp);
    }
    
    function purchase()  external payable {

        require(isForSale, "Not for sale");
        require(msg.value >= salePrice, "There is not enough money to succes transaction Bro");

        isForSale = false;
        address _oldOwner = _owner; 
        _owner = msg.sender;

        (bool succes, ) = _oldOwner.call{value: msg.value} ("");
        require (succes);

        emit Purchase(msg.value, msg.sender);
    }

}
