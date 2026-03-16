// SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BardToken} from "../src/BardToken.sol";

contract DeployBardToken is Script {
    function run() external returns (BardToken) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        uint256 initialSupply = 1000 * 1e18;

        vm.startBroadcast(deployerPrivateKey);
        BardToken token = new BardToken(initialSupply);
        vm.stopBroadcast();

        return token;
    }
}
