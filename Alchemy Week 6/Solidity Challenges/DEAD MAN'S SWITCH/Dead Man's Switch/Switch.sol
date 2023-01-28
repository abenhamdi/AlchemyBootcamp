// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

error Switch_notOwner(); 
error Switch_TimetoRemind();

contract Switch {
    address private recepient; 
    address private owner; 
    uint private pingT;

    modifier onlyOwner(){
        if(msg.sender != owner){
            revert Switch_notOwner();
        }
        _;
    }

    constructor (address _recepient) payable {
        owner = msg.sender; 
        recepient = _recepient; 
        pingT = block.timestamp; 
    }
    function withdraw() external{
        if(block.timestamp - pingT < 52 weeks){
            revert Switch_TimetoRemind();
        }
        (bool success, )= msg.sender.call{ value : address(this).balance}("");
        require(success);
    }
    function ping() external onlyOwner{
        pingT = block.timestamp;
    }
    
}
