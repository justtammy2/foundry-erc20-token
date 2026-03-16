BardToken

A simple ERC-20 token built with **Solidity**, **Foundry**, and **OpenZeppelin**.  
This project demonstrates writing, testing, and deploying a token contract using the Foundry toolchain.

---

## Features

- ERC-20 standard token
- Owner-controlled minting
- Token burning support
- Automated tests using Foundry
- Deployment script included

---

## Tech Stack

- Solidity
- Foundry
- OpenZeppelin Contracts
- Anvil (local Ethereum node)

---

## Project Structure

foundry-erc20-token
├── src/
│ └── BardToken.sol
├── test/
│ └── BardTokenTest.t.sol
├── script/
│ └── DeployBardToken.s.sol
├── foundry.toml
└── README.md

---

## Installation

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/foundry-erc20-token.git
cd foundry-erc20-token

Install dependencies:

forge install

Build the project:

forge build
```
