The solution for this challenge is to create another contract, fund it with `1 eth` and then invoke the `selfdestruct(victimAddress)` function.

The target contract does not have a receive or fallback function but by invoking the `selfdestruct` it can no be prevent receiving eth.

So, doing the mentioned proccess will lead to `uint256 withdrawn = startBalance - address(this).balance;` be equal to 1 eth and transfering all the funds to the address.
