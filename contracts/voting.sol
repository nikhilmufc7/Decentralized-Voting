pragma solidity ^0.4.18;

contract voting{
  bytes32[] private candidate;

  address[] private voters;

  mapping (bytes32 => uint8) private votesRecieved;

}