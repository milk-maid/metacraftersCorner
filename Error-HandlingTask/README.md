# Error Handling In Smart Contract Development

Build a contract to test out Error Handling with `require`, `assert`, `revert` and `custom error`.

## Description

This Ethereum smart contract, named `ErrorHandling`, demonstrates various error-handling mechanisms in Solidity. It provides examples of using `require` and `revert` statements to validate conditions such as input values and execution requirements. The contract also showcases the use of `assert` for testing internal errors and invariants.

In addition, the contract introduces a custom error, `NotAllowedInYet`, to handle scenarios where a withdrawal amount exceeds the contract's balance. This exemplifies how to create and utilize custom errors for more specific and informative error messaging. Developers can explore this codebase to gain insights into best practices for handling errors in their Solidity smart contracts.

## Getting Started

Use the official ```ethereum.remix.org```

### Installing

* To save stress for upcoming devs in the Web3 world interact with the contract on REMIX IDE
* When deploying use the default providers provided for you by `remixIDE`

### Executing program

* The solidity code to test `require` and `revert`

```javascript

contract ErrorHandling {

    uint8 public ind;

    error NotAllowedInYet(bytes amount);

    function adultsOnly(uint8 _age) public returns(string memory) {
        // require statement in action
        require(_age > 18, "Only for ADULTS!!!");
        ind = _age;
        return "Enjoy";
    }

    function childrenCorner(uint8 _age) public returns(uint8) {
        // revert() is used when the condition is complex.
        if (_age > 10) {
            revert("Only childrn are allowed here");
        }
        return ind = _age;
    }
}

```

* Call this function to understand how `assert` works

```javascript

    function assertChildren(uint8 _input) public view {
        assert(ind < _input);
    }

```

* This function uses the `custom error` method

```javascript

   function useCustomError(uint8 _amount) public view {
        // revert used internally to handle errors
        if (ind < _amount) {
            revert NotAllowedInYet({amount: abi.encode(_amount)});
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

