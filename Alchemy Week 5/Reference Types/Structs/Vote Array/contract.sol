// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	Vote none = Vote(Choices(0), address(0));
	
	// TODO: create a public state variable: an array of votesl
	Vote[] public votes; 

	function createVote(Choices choice) external {
		// TODO: add a new vote to the array of votes state variable
		Vote memory vote = findVote(msg.sender);

		require(vote.voter == address(0), "Go fuck yourself"); 
		votes.push(Vote(choice, msg.sender));
	}
	function changeVote(Choices choice) external {
	//	Vote memory vote = findVote(user); 
		for (uint i=0; i < votes.length; i++){
			if (votes[i].voter == msg.sender){
				votes[i].choice = choice;
			}
		}

	}
	function hasVoted(address user) public view returns(bool _hasVoted){

		Vote memory vote = findVote(user);
		return vote.voter == user;  
	}

	function findChoice(address user) external view returns (Choices choice){

		Vote memory vote = findVote(user);
		return vote.choice; 
	}
	function findVote(address user) internal view returns (Vote memory){

		Vote[] memory localVotes = votes;
		for(uint i = 0; i < localVotes.length; i++){

			if(localVotes[i].voter == user){
				return localVotes[i];
			}
		}
	return none;

	}
}
