// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {

    // error
    error MoodNft__CantFlipMoodIfNotOwner();

    uint256 private s_tokenCounter;
    string private s_sadSvg;
    string private s_happySvg;
    
    enum Mood {
        HAPPY,
        SAD
    }

    mapping (uint256 => Mood) private s_tokenIdToMood;

    constructor(string memory sadSvg,
                string memory happySvg
    ) ERC721("Mood NFT","MN"){
        s_tokenCounter = 0;
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;
        s_happySvg = happySvg;
        s_sadSvg = sadSvg;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function flipMood(uint256 tokenId) public {
        // only want the NFT owner to be able to change the mood
       address spender = msg.sender;
       address owner = ownerOf(tokenId);
        if(spender == owner || getApproved(tokenId) == spender || isApprovedForAll(owner,spender)){
            revert MoodNft__CantFlipMoodIfNotOwner();
        }
        if(s_tokenIdToMood[tokenId] == Mood.HAPPY){
            s_tokenIdToMood[tokenId] = Mood.SAD;
        } else {
            s_tokenIdToMood[tokenId] = Mood.HAPPY;
        }
    }

    function tokenURI(
        uint256 tokenid
    ) public view override returns(string memory){
        string memory imageUri;
        if(s_tokenIdToMood[tokenid] == Mood.HAPPY){
            imageUri = s_happySvg;
        }else {
            imageUri = s_sadSvg;
        }
        return string(abi.encodePacked(
            _baseURI(),
            Base64.encode(
                bytes(
                    abi.encodePacked(
                        '{"name": "', 
                           name(), 
                           '", "description": "An NFT that reflects the owners mood","atrributes": [{"trait_type": "moodiness", "value": 100}], "image": "', 
                           imageUri, 
                           '"}'
                        )
                    )
            )
        ));
}
    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64";
    }
}