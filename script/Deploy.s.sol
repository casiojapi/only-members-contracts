// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "../src/ProofNFT.sol"; // Path to your contract

contract DeployScript is Script {
    function run() external {
        vm.startBroadcast(); // Start broadcasting transactions

        ProofNFT proofNFT = new ProofNFT(); // Deploy the contract
        console.log("ProofNFT deployed at:", address(proofNFT));

        vm.stopBroadcast(); // Stop broadcasting transactions
    }
}
