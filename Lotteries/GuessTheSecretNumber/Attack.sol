pragma solidity ^0.4.21;

contract Attack {

    bytes32 hashAnswer = 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;

    function attack() external view returns(uint8) {
      for (uint8 i = 1; i < 256; i++) {
           if (keccak256(i) == hashAnswer) {
            return i;
        }
      }
    }
}