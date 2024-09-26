//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import "../src/myStableCoin.sol";

contract testMyStableCoin is Test {
    MyStableCoin stableCoin;

    function setUp() public {
        stableCoin = new MyStableCoin();
    }

    function testInitialBalance() public {
        assertEq(
            stableCoin.balanceOf(address(this)),
            1000000 * 10 ** stableCoin.decimals()
        );
    }

    function testTransfer() public {
        uint256 transferMoney = 100;
        stableCoin.transfer(address(1), transferMoney);
        assertEq(stableCoin.balanceOf(address(1)), transferMoney);
        assertEq(
            stableCoin.balanceOf(address(this)),
            1000000 * 10 ** stableCoin.decimals() - transferMoney
        );
    }

    function testTotalSupply() public {
        assertEq(
            stableCoin.totalSupply(),
            1000000 * 10 ** stableCoin.decimals()
        );
    }

    // function testTransferExceeds() public {
    //     uint256 initialBalance = stableCoin.balanceOf(address(this));
    //     assertEq(initialBalance, 1000000 * 10 ** stableCoin.decimals());
    //     vm.expectRevert("ERC: Transfer cannot exceed the actual balance");
    //     stableCoin.transfer(address(5), initialBalance + 2);
    // }

    function testTransferExceedsBalance() public {
        uint256 initialBalance = stableCoin.balanceOf(address(this));

        // Log the initial balance for clarity
        console.log("Initial Balance:", initialBalance);

        // Expect the revert for insufficient balance
        vm.expectRevert(
            abi.encodeWithSelector(
                MyStableCoin.ERC20InsufficientBalance.selector, // Custom error selector
                address(this), // Account that caused the revert
                initialBalance, // Current balance
                initialBalance + 1 // Amount trying to transfer (more than balance)
            )
        );

        // Attempt to transfer more tokens than the initial balance
        stableCoin.transfer(address(2), initialBalance + 1); // This should trigger the revert
    }

    function testAlwaysRevert() public {
        vm.expectRevert("This is a test revert");
        stableCoin.alwaysRevert();
    }
}
