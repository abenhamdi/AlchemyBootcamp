// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

error Token_NotEnoughMoney(); 

contract Token {

    uint public totalSupply = 1000 * (10 ** 18);
    uint8 public decimals = 18;
    string public name = "moroccoToken";
    string public symbol = "MTO";   

    mapping (address => uint256) private _balances;
    
    event Transfer( address sender, address received, uint256 amount);

    constructor(){
        totalSupply= 1000 * 1e18;
        _balances[msg.sender] = totalSupply;
    }

    function balanceOf(address owner) external view returns(uint256){
        return _balances[owner];
    }

    function transfer(address recipient, uint256 amount) public returns (bool){    
        
        if(_balances[msg.sender] < amount){
            revert Token_NotEnoughMoney(); 
        }
        _balances[msg.sender] -= amount; 
        _balances[recipient] += amount; 
        
        emit Transfer(msg.sender, recipient, amount);
        return true; 
    }   
}
