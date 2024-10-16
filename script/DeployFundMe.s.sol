// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {FundMe} from "../src/FundMe.sol";
import {Script, console} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {

    

    function run() external returns(FundMe) {
        // BEfore startBroadcast -> Not a "real" tx // Only simulate this in simulated environment
        HelperConfig helperConfig = new HelperConfig();
        /*(*/ address ethUsdPriceFeed/*, address, (according to the struct) ,)*/  = helperConfig.activeNetworkConfig();


        // After startBroadcast -> Real tx!
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
        
    } 

}