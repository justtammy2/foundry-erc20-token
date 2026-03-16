// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BardToken} from "../src/BardToken.sol";

contract BardTokenTest is Test {
    BardToken token;

    address owner = address(1);
    address user = address(2);

    uint256 initialSupply = 1000 * 10 ** 18;

    function setUp() public {
        vm.prank(owner);
        token = new BardToken(initialSupply);
    }

    function testInitialSupplyMintedToOwner() public {
        assertEq(token.balanceOf(owner), initialSupply);
        assertEq(token.totalSupply(), initialSupply);
    }

    function testOwnerCanMint() public {
        uint256 mintAmount = 100 * 1e18;

        vm.prank(owner);
        token.mint(user, mintAmount);

        assertEq(token.balanceOf(user), mintAmount);
        assertEq(token.totalSupply(), initialSupply + mintAmount);
    }

    function testNonOwnerCannotMint() public {
        vm.prank(user);
        vm.expectRevert();
        token.mint(user, 100 * 1e18);
    }

    function testTransferTokens() public {
        uint256 transferAmount = 200 * 1e18;

        vm.prank(owner);
        token.transfer(user, transferAmount);

        assertEq(token.balanceOf(user), transferAmount);
        assertEq(token.balanceOf(owner), initialSupply - transferAmount);
    }

    function testBurnTokens() public {
        uint256 burnAmount = 100 * 1e18;

        vm.prank(owner);
        token.burn(burnAmount);

        assertEq(token.balanceOf(owner), initialSupply - burnAmount);
        assertEq(token.totalSupply(), initialSupply - burnAmount);
    }
}
