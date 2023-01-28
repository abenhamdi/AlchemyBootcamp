// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}
    mapping (address => User) public users;

	modifier doExist(){
		// check if the balance user is > 1, it mean that is an active user 
		require(users[msg.sender].balance == 0, "User Already exist.");
		_;
	}
	function createUser( ) external doExist{
	
		users[msg.sender]= User(100, true);

	}

	function transfer( address recipient,  uint amount) external {
		
		require(users[msg.sender].balance > 0, "Caller isn't active");

		require(users[recipient].balance > 0, "Sender isn't active");

		require(users[msg.sender].balance > amount, "There is not enough money bro"); 

		users[msg.sender].balance -= amount ;
		users[recipient].balance += amount; 
 	}
}
