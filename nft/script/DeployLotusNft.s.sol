// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {LotusNft} from "../src/LotusNft.sol";
contract DeployLotusNft is Script {

    string public constant NAME = "Lotus";
    string public constant SYMBOL = "LOT";

    string public constant LOTUS_URI = "https://ipfs.io/ipfs/QmaqczY6mSLmR4PWYW34vsZkpr9oWMaYPFz3WFn3r8aVzv";
    string public constant BULLMARKEY_URI = "https://ipfs.io/ipfs/QmaqczY6mSLmR4PWYW34vsZkpr9oWMaYPFz3WFn3r8aVzv";
    address public constant USER_SAKSHAM = 0xD47B767Ab64eF004FBE85d55a49f9f2C9f305Cce;
    //0x498303A0F3Ee6F3ED6301E7cA910ef54B6F0453C;

    function run()  external returns (LotusNft){
        vm.startBroadcast();
        LotusNft lotusNft = new LotusNft(NAME, SYMBOL);
        lotusNft.mintNft(LOTUS_URI, USER_SAKSHAM);
        vm.stopBroadcast();
        return lotusNft;
    }
}