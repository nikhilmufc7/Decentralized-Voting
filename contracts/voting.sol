pragma solidity ^0.4.18;

contract Voting {
  bytes32[] private candidate;

  address[] private voters;

  mapping (bytes32 => uint8) private votesRecieved;

  function Voting(bytes32[] candidateNames) public {
    candidates = candidateNames;
  }
}

function getResults (bytes32 candidate) public{
  // necessary for d
  require(ifValidCandidate(candidate));
  require(ifValidVote(msg.sender));

  votesRecieved[candidate] += 1;
  voters.push(msg.sender)

}

function ifValidCandidate(bytes32 candidate) view public returns (bool) {

    for(uint i = 0; i < candidates.length; i++) {
      if (candidates[i] == candidate) {
        return true;
      }
    }
    return false;
  }

  function ifValidVoter(address voter) view public returns (bool) {
    for(uint i = 0; i < voters.length; i++) {
      if (voters[i] == voter) {
        return false;
      }
    }
    return true;
  }
}