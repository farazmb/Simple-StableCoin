//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract MyStableCoin is ERC20 {
    constructor() ERC20("MyStableCoin", "MSC") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function alwaysRevert() public pure {
        revert("This is a test revert");
    }
}
