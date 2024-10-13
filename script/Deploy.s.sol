// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {MyToken} from "../Challenge/ERC20-Challenge.sol";

// forge script script/Deploy.s.sol:DeployScript --rpc-url scrollSepolia --broadcast --verify
contract DeployScript is Script {
    MyToken public token;

    function setUp() public {}

    function run() public {
        uint privateKey = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        token = new MyToken(100e18);
        console.logString(
            string.concat(
                "!!! YourContract deployed at: ",
                vm.toString(address(token))
            )
        );

        vm.stopBroadcast();
    }
}
