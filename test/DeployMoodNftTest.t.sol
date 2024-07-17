// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployMoodNft} from "../script/DeployMoodNft.s.sol";
import {console} from "forge-std/console.sol";

contract DeployMoodNftTest is Test {
    
    DeployMoodNft public deployer;

    function setUp()  public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public{
        string memory expectedUri =  "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj48dGV4dCB4PSIwIiB5PSAiMTUiIGZpbGw9ImJsYWNrIj4gaGkhIFlvdSBkZWNvZGVkIHRoaXMhIDwvdGV4dD48L3N2Zz4=";
        string memory actualUriStr = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj48dGV4dCB4PSIwIiB5PSAiMTUiIGZpbGw9ImJsYWNrIj4gaGkhIFlvdSBkZWNvZGVkIHRoaXMhIDwvdGV4dD48L3N2Zz4=";
        string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="0" y= "15" fill="black"> hi! You decoded this! </text></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        console.log("Actual Response: ", actualUri);
        assert(
            keccak256(abi.encodePacked(actualUri)) ==
            keccak256(abi.encodePacked(expectedUri))
            );
    }

}