# Native ERC20 Token and Vault

Build a simple native currency, to be used as the in-game currency for the DeFi Platform.

## Description

This contract is a simple native ERC20Token and the token Vault built in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract basic ERC20 Token ffunctionality and functions like the mint, approve and others while the Vault has the functionality to deposit, withdraw, and so on. Both are needed for interaction in the DeFi Platform we are about building

## Getting Started

### Installing

* To save stress for upcoming devs in the Web3 world interact with the contract on REMIX IDE
* When deploying use the Injected Privider to enable your wallet pop-up

### Executing program

* Set your Token Symbol and name at the start

```javascript
    string public name = "RoqeebTk";
    string public symbol = "RQB";
```

* Call this function next with your token contarct address to mint the token to you to be used in the Vault

```javascript
    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }
```

## Help

If you encounter any issue, do not hesitate to use the issues tab on this github repo or go throug the REMIX docs

## Authors

milk-maid  
[Roqbell](https://twitter.com/the_roqbell)

<!-- ## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details -->
