// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LotusNft is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) {
        s_tokenCounter = 0;
        //s_tokenIdToUri[1] = "https://ipfs.io/ipfs/QmaqczY6mSLmR4PWYW34vsZkpr9oWMaYPFz3WFn3r8aVzv";
    }

    function mintNft(string memory tokenUri, address _user) public {
        require(
            s_tokenCounter < 10,
            "Exceeded the Max Token Count for Minting."
        );
        require(address(_user) != address(0), "Cannot be a zero address");
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(_user, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 _tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToUri[_tokenId];
    }
}

// https://ipfs.io/ipfs/QmaqczY6mSLmR4PWYW34vsZkpr9oWMaYPFz3WFn3r8aVzv?filename=lotus.jpg
