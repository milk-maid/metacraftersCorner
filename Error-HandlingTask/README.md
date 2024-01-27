# Error Handling In Smart Contract Development

Build a contract to test out Error Handling with `require`, `assert`, `revert` and `custom error`.

## Description

This Ethereum smart contract, named `ErrorHandling`, demonstrates various error-handling mechanisms in Solidity. It provides examples of using `require` and `revert` statements to validate conditions such as input values and execution requirements. The contract also showcases the use of `assert` for testing internal errors and invariants.

In addition, the contract introduces a custom error, `InsufficientBalance`, to handle scenarios where a withdrawal amount exceeds the contract's balance. This exemplifies how to create and utilize custom errors for more specific and informative error messaging. Developers can explore this codebase to gain insights into best practices for handling errors in their Solidity smart contracts.

## Getting Started

Use the official ```ethereum.remix.org```

### Installing

* To save stress for upcoming devs in the Web3 world interact with the contract on REMIX IDE
* When deploying use the default providers provided for you by `remixIDE`

### Executing program

* The solidity code to test `require` and `revert`

```javascript
contract ErrorHandling {
    function testRequire(uint _i) public pure {
        // Require is used to validate conditions e.g
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        // Revert is useful when the condition to check is complex.
        // This code does the exact same thing as the above
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }
}
```

* Call this function to understand how `assert` works

```javascript

    uint public num;

    function testAssert() public view {
        // Assert is only used to test for internal errors,
        // and to check invariants.
        assert(num == 0);
    }

```

* Use this function to understand `custom error`

```javascript

   error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }

```

## Help

If you encounter any issue, do not hesitate to use the issues tab on this github repo, HURRAY!!! my DMs are open!

## Authors

milk-maid
[Roqbell](https://twitter.com/the_roqbell)

<!--
## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details
-->

