// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error Party_AlreadyRegistred(); 
error Party_InvalidAmount(); 

contract Party {
    
    uint private rsvpAmou; 

    address [] private participants; 

	constructor (uint _amount){
        rsvpAmou = _amount; 
    }
    function rsvp() external payable{

        address [] memory addressCopy = participants; 
        bool isTrue;

        for(uint i =0; i< addressCopy.length; i++){
            if(addressCopy[i] == msg.sender){
                isTrue = true; 
                break;
            }
        }
        if(isTrue){
            revert Party_AlreadyRegistred();
        }

        if(msg.value < rsvpAmou ||  msg.value > rsvpAmou){
            revert Party_InvalidAmount();
        }
        participants.push(msg.sender);

    }
    function payBill(address venue, uint256 amount)public {

        uint contractBalance = address(this).balance;
        uint distributeAmount = contractBalance - amount; 

        (bool success, ) =  venue.call{ value: amount}("");
        require(success);

        address[] memory addressesCopy = participants; 
        uint individualReturn =  distributeAmount / addressesCopy.length; 

        for(uint i =0; i< addressesCopy.length; i++){
            (bool distribute,  )= addressesCopy[i].call{value: individualReturn}("");
            require (distribute);
            }

    }
}
