The solution for this challenge consist of generating an overflow in the require state for the `buy(uint256 numTokens)` function.

- Require statement:

```bash
require(msg.value == numTokens * PRICE_PER_TOKEN);
```

In order to get the overflow we need to take into account that the max bit size for uint256 is 2^256 so we have to choose a value for `numTokens` such that multiplied for `PRICE_PER_TOKEN` exceeds the value 2^256 (reachs 2^256 + 1). Take into consideration that `PRICE_PER_TOKEN` is equal to 1^18 (1 eth has 18 decimals).

If we compute the maths we reach that the solution for `numTokens` should be the solution for (2^256 + 1) / 10^18. The problem is that such operation lead to not integer numbers that are downgraded by the Solidity compiler...

To solve the this problem, we need to choose a number that multiplied for 1^18 lead to a result that expresed in bits has 256 zeros in their lowest positions. As 10^18 expressed in binary is equal to `110111100000101101101011001110100111011001000000000000000000`, already has 18 zeros, we need to chose a value that has (256 - 18 = 238 zeros) -> 2^238

Sure enough, we can pass 2\*\*238 for our numTokens, and do this challenge with no sent value.

Answer in decimal/bin/hex:

```bash
441711766194596082395824375185729628956870974218904739530401550323154944
0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0x400000000000000000000000000000000000000000000000000000000000
```

The explanation can be also found [here](https://ethereum.stackexchange.com/questions/131516/integer-overflow-not-ocurring-as-expected-in-capture-the-ether-token-sale-challe/131705#131705).
