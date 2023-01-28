// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract StackClub {
    address[] public members; 
    address public deployer;

    constructor (){
        members.push(deployer);
    }
    function addMember(address newMember)external {
        members.push(newMember);
    }
    
    function isMember(address user) public view returns( bool _isMember) {
        address[] memory membership = members; 
        for(uint i = 0; i < membership.length; i++){
            if(membership[i] ==  user){
                return true; 
            }
        }  
    }
    function removeLastMember() external{
        require(isMember(deployer), "Go fuck yourslef ! you're not allowed to pop member");
        members.pop();
    }
}
