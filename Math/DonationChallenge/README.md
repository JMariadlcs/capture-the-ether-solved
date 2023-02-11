In order to solve this challenge we need to notice that the variable donation was not set as `memory` so it was initialized as `storage` by default. As Donation is a struct with 2 parameters and was initialized as storage, each of the parameters are now pointing to slot 0 and slot 1.

Slot 1 in our contract is the slot reserved for the `owner` so we need to use `donation.etherAmount` which is pointing to the `owner` slot to overwrite it with our address and become owners.
To do it we need to cast our `address` to `uint` and use it for `etherAmount`.

Important, we need to set `msg.value` as `etherAmount / scale` being `uint256 scale = 10**18 * 1 ether`. This convertion is another bug, `1 ether` is a macro for 11e18 so, scale is actually 1e18\*1e18 or 1e36. We need to take this value into account to set the `msg.value` correctly.
