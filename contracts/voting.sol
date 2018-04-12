pragma solidity ^0.4.18;

contract Voting {
  // list all the candidates
  bytes32[] private candidates;

  // list all the voters
  address[] private voters;

  // hashmap to get the votes d
  mapping (bytes32 => uint8) private votesReceived;

  // Constructor for names of candidates standing in election
  function Voting(bytes32[] candidateNames) public {
    candidates = candidateNames;
  }

  function getVotingResultForCandidate(bytes32 candidate) view public returns (uint8) {
    return votesReceived[candidate];
  }

  function voteForCandidate(bytes32 candidate) public {
    // to check if candidate is legit
    require(isValidCandidate(candidate));
    require(isValidVoter(msg.sender));

    votesReceived[candidate] += 1;
    voters.push(msg.sender);
  }

  // for verifying if candidate is legit as well as the vote
  function isValidCandidate(bytes32 candidate) view public returns (bool) {
    for(uint i = 0; i < candidates.length; i++) {
      if (candidates[i] == candidate) {
        return true;
      }
    }
    return false;
  }

  function isValidVoter(address voter) view public returns (bool) {
    for(uint i = 0; i < voters.length; i++) {
      if (voters[i] == voter) {
        return false;
      }
    }
    return true;
  }
}
