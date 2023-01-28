// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error Not_VotingMemberCrew();

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    Proposal[] public proposals;
    
    mapping(uint => bool) private proposalIdIntoVoteStatus;
    
    address[] private memberCrew;
    event ProposalCreated (uint indexed proposalId);
    event VoteCast (uint indexed proposalId, address indexed voter);

    constructor(address[] memory _memberCrew){
        memberCrew = _memberCrew; 
        memberCrew.push(msg.sender);
    }

    function newProposal(address target, bytes memory data) external {
        if(!isMemberCrew(msg.sender)){
            revert Not_VotingMemberCrew();
        }
        proposals.push(Proposal(target, data, 0, 0));
        emit ProposalCreated(proposals.length - 1);
    }
    function castVote(uint proposalId, bool status) external {
        if(!isMemberCrew(msg.sender)){
            revert Not_VotingMemberCrew();
        }
        Proposal storage proposal = proposals[proposalId];

        if(proposalIdIntoVoteStatus[proposalId]) {
            if(status) {
                proposal.yesCount++;
                if(proposal.noCount > 0) {
                    proposal.noCount--;
                }
            } else {
                proposal.noCount++;
                if(proposal.yesCount > 0) {
                    proposal.yesCount--;
                }
            }
        } else {


            if(status) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }

            proposalIdIntoVoteStatus[proposalId] = true;
        }
        if(proposal.yesCount >= 10){
            (bool success, ) = proposal.target.call (proposal.data);
            require(success); 
        }
        emit VoteCast(proposalId, msg.sender);
 
    }
    function isMemberCrew(address caller)private view returns(bool){

        address[] memory membersCrewCopy = memberCrew; 

        for(uint i =0;  i < membersCrewCopy.length; i++){
            if(caller == membersCrewCopy[i]){
                return true;
            }
        }
        return false;
    }
   
}
