// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {LotusNft} from "../src/LotusNft.sol";
import {DeployLotusNft} from "../script/DeployLotusNft.s.sol";

contract LotusNftTest is Test {
    DeployLotusNft deployer;
    LotusNft lotusNft;
    address public USER = makeAddr("user");
    string public constant PUG = "https://ipfs.io/ipfs/QmaqczY6mSLmR4PWYW34vsZkpr9oWMaYPFz3WFn3r8aVzv";
    
    function setUp() public{
        deployer = new DeployLotusNft();
        lotusNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Lotus";
        string memory actualName = lotusNft.name();
        assert(
            keccak256(abi.encodePacked(expectedName)) == 
                keccak256(abi.encodePacked(actualName))
        );
        assertEq(actualName, expectedName);
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        lotusNft.mintNft(PUG,USER);

        assert(lotusNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(PUG)) == 
                keccak256(abi.encodePacked(lotusNft.tokenURI(0)))
        );
    }
}