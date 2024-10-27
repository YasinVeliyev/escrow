// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Escrow} from "../src/Escrow.sol";

contract CounterScript is Script {
    Escrow public escrow;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        address arbiter = address(2);
        address depositor = address(3);
        escrow = new Escrow(arbiter, depositor);

        vm.stopBroadcast();
    }
}
