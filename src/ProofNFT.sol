// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ProofNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter = 1;

    constructor() ERC721("probadoLince", "ONLYMEMBER") {}

    function verifyAndMint(address to, string memory proof) public onlyOwner returns (bool) {
        //bool isValidProof = keccak256(abi.encodePacked(proof)) == keccak256(abi.encodePacked("valid-proof"));
	
	bool isValidProof = true;
        require(isValidProof, "Invalid proof");

        // Mint NFT if the proof is valid
        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, "ipfs://your-metadata-url"); // Set NFT metadata

        return true;
    }
}
