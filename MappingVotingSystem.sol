// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 < 0.9.0;


contract VotingSystem {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    uint public totalCandidates;
    mapping(address => bool) public hasVoted;

    constructor(string[] memory _candidateNames) {
        require(_candidateNames.length > 0, "At least one candidate required");

        for (uint i = 0; i < _candidateNames.length; i++) {
            totalCandidates++;
            candidates[totalCandidates] = Candidate(totalCandidates, _candidateNames[i], 0);
        }
    }

    function vote(uint _candidateId) public {
        require(_candidateId > 0 && _candidateId <= totalCandidates, "Invalid candidate ID");
        require(!hasVoted[msg.sender], "You have already voted");

        candidates[_candidateId].voteCount++;
        hasVoted[msg.sender] = true;
    }

    function getCandidateVotes(uint _candidateId) public view returns (uint) {
        require(_candidateId > 0 && _candidateId <= totalCandidates, "Invalid candidate ID");
        return candidates[_candidateId].voteCount;
    }

    function getTotalCandidates() public view returns (uint) {
        return totalCandidates;
    }
}