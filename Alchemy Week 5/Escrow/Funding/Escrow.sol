// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Escrow {

    address public depositor; // address deploying the contract 
    address public beneficiary;
    address public arbiter; 
    bool public isApproved = false;
    
    event Approved(uint indexed balance);
    
    constructor (address _arbiter, address _beneficiary)payable{

        depositor = msg.sender; // Store the depositor address into the deploying address same :/
        arbiter = _arbiter; 
        beneficiary = _beneficiary; 
    }
    modifier onlyArbiter(){
        require(msg.sender == arbiter, "Go make Around! Only Arbiter can transfer Ethers");
        _;
    }
    function approve() external onlyArbiter{

        isApproved = true;
        uint contractBalance = address(this).balance;
        (bool success, ) = beneficiary.call{ value: contractBalance }("");
        require(success, "Failed to send ether");  

        emit Approved(contractBalance);    
    }

}
