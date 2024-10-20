// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "../src/ProofNFT.sol";

contract DeployScript is Script {
    function run() external {
        address deployer = vm.envAddress("ETH_FROM"); // Use deployer from env

        vm.startBroadcast(deployer); // Start broadcasting with deployer's address

        ProofNFT proofNFT = new ProofNFT(); // Deploy the contract

        console.log("ProofNFT deployed at:", address(proofNFT));

        vm.stopBroadcast(); // Stop broadcasting
    }
}
