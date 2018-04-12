pragma solidity ^0.4.18;

contract Voting {
  bytes32[] private candidate;

  address[] private voters;

  mapping (bytes32 => uint8) private votesRecieved;

  function Voting(bytes32[] candidateNames) public {
    candidates = candidateNames;
  }
}
