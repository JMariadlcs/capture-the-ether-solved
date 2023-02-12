Recall that an address is the last 20 bytes of the keccak-256 hash of the address’s public key.
The public key associated with an address can be derived from a transaction signature. In this case, the account’s public key we need can indeed be derives as the account has made at least one transaction.

The transaction in question has the following hash: 0xabc467bedd1d17462fcc7942d0af7874d6f8bdefee2b299c9168a216d3ff0edb.

This transaction is the only transaction that this account has signed, but because it was signed by this address and it’s an outgoing transaction, we can derive the public key from this specific transaction’s v, r and s.

See more information and explanation about this [here](https://dac.ac/blog/capture_the_ether_solutions/#solution-11) and [here](https://cmichel.io/capture-the-ether-solutions/).
