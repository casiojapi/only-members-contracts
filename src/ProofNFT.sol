// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract ProofNFT is ERC721URIStorage {
    uint256 private _tokenIdCounter = 1;

    constructor() ERC721("ProofNFT", "PNFT") {}

    function verifyAndMint(address to, string memory proof, string memory imageUrl) public returns (bool) {
        //require(keccak256(abi.encodePacked(proof)) == keccak256(abi.encodePacked("valid-proof")), "Invalid proof");

        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter++;

        // Construct metadata JSON with the provided image URL
        string memory metadata = string(
            abi.encodePacked(
                '{"name": "Proof NFT", "description": "An NFT based on proof.", "image": "', 
                imageUrl,
                '"}'
            )
        );

        // Set the token URI using the metadata JSON string
        string memory tokenURI = string(abi.encodePacked("data:application/json;base64,", base64Encode(bytes(metadata))));
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);

        return true;
    }

    // Helper function to encode the metadata in base64
    function base64Encode(bytes memory data) internal pure returns (string memory) {
        string memory TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
        uint256 len = data.length;
        if (len == 0) return "";

        // Base64 encoding logic
        string memory result = new string(4 * ((len + 2) / 3));
        bytes memory table = bytes(TABLE);
        bytes memory res = bytes(result);

        for (uint256 i = 0; i < len; i += 3) {
            uint256 a = uint8(data[i]);
            uint256 b = i + 1 < len ? uint8(data[i + 1]) : 0;
            uint256 c = i + 2 < len ? uint8(data[i + 2]) : 0;

            uint256 chunk = (a << 16) | (b << 8) | c;
            res[i / 3 * 4] = table[(chunk >> 18) & 63];
            res[i / 3 * 4 + 1] = table[(chunk >> 12) & 63];
            res[i / 3 * 4 + 2] = table[(chunk >> 6) & 63];
            res[i / 3 * 4 + 3] = table[chunk & 63];
        }

        return string(res);
    }
}
