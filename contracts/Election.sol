pragma solidity ^0.4.24;

contract Election {

	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}
	
	mapping (uint => Candidate) public candidates;
	mapping (address => bool) public voters;
	
	uint public candidatesCount;
	

	constructor () public {
		addCandidate("Imran Khan");
		addCandidate("Nawaz Sharif");
	}

	function addCandidate (string _name) internal {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote (uint _id) public {
		
		require (!voters[msg.sender]);
		require (_id > 0 && _id <= candidatesCount);
		
		voters[msg.sender] = true;
		candidates[_id].voteCount++;
	}	
	
}