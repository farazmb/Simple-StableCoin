
# MyStableCoin

MyStableCoin is a simple ERC20 compliant stablecoin implemented in Solidity. This project demonstrates the basic functionality of a token, including minting and transferring tokens, with a focus on testing the functionality using Foundry.


## Features

- ERC20 Token implementation
- Initial supply minted to the deployer
- Basic transfer functionality with revert checks for insufficient balance

## Getting Started

To get started with this project, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/MyStableCoin.git
   cd MyStableCoin
   ```

2. **Install dependencies:**
   Ensure you have Foundry installed. If not, follow the instructions at [Foundry's official documentation](https://book.getfoundry.sh/).

3. **Compile the contracts:**
   ```bash
   forge build
   ```

4. **Run the tests:**
   ```bash
   forge test
   ```

## Contract Overview

The main contract, `MyStableCoin`, extends the OpenZeppelin ERC20 contract:

```solidity
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract MyStableCoin is ERC20 {
    constructor() ERC20("MyStableCoin", "MSC") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
```

### Functions

- **Constructor:** Mints an initial supply of 1,000,000 tokens to the deployer's address.
- **Transfer:** Allows users to transfer tokens to other addresses, with checks to prevent transfers exceeding the available balance.

## Testing

The project includes tests written in Solidity to verify the functionality of the token contract.

### Example Test

The following test checks if the transfer function correctly reverts when attempting to transfer more than the available balance:

```solidity
function testTransferExceedsBalance() public {
    // Test logic
}
```

Run the tests using:

```bash
forge test
```
