// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {LotusNft} from "../src/LotusNft.sol";
contract DeployLotusNft is Script {

    string public constant NAME = "Lotus";
    string public constant SYMBOL = "LOT";

    function run()  external returns (LotusNft){
        vm.startBroadcast();
        LotusNft lotusNft = new LotusNft(NAME,SYMBOL);
        vm.stopBroadcast();
        return lotusNft;
    }
}