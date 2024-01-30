# Degen Token for Gamers

Degen Token is an ERC-20 token built on the Ethereum blockchain using OpenZeppelin contracts. This token is designed for gamers to enable its use in their game.

## Features

- ERC-20 standard compliant.
- Minting and burning capabilities.
- Custom assets enumeration (burger, shield, power, viel).
- Ownership management using the Ownable contract.
- And lots more

## Table of Contents

- [Degen Token for Gamers](#degen-token-for-gamers)
  - [Features](#features)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)

## Getting Started

### Prerequisites

Make sure you have the following installed:

- [Node.js](https://nodejs.org/)
<!-- - [Yarn](https://yarnpkg.com/) -->

### Installation

1. **Clone the repository:**

   ```bash
   git clone the repo
   cd degen-token
   ```

Install dependencies:

```bash
npm install
```

Usage
Deploy the contract:

```bash
Copy code
npx hardhat run scripts/deploy.js --network fuji
Replace fuji with the desired network (hardhat, fuji, mainnet).
```

Interact with the contract:

```javascript
Copy code
// Example script to mint tokens
const { ethers } = require("ethers");
const { network } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  const DegenToken = await ethers.getContractFactory("DegenToken");
  const degenToken = await DegenToken.deploy();

  await degenToken.deployed();

  console.log("Degen Token deployed to:", degenToken.address);

  // Add more interactions...
```
