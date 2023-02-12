To solve the challenge we must notice that the `withdraw()` function for TokenBank is implemented in such a way that allows reentrancy attacks (first sendTransaction and later update the ballance).

A detailed approach can be found [here](https://cmichel.io/capture-the-ether-solutions/).
