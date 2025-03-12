// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Vm.sol";
import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

import {Script, console} from "forge-std/Script.sol";
import {FoundryTest} from "../src/FoundryTest.sol";
import {EmptyContract} from "../src/utils/EmptyContract.sol";

contract FoundryTestScript is Script {
    EmptyContract public emptyContract;
    ProxyAdmin public foundryTestProxyAdmin;

    FoundryTest public foundryTest;
    FoundryTest public foundryTestImplementation;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);
        console.log("Deployer address:", deployerAddress);

        vm.startBroadcast(deployerPrivateKey);

        emptyContract = new EmptyContract();
        TransparentUpgradeableProxy proxyEmptyContract =
            new TransparentUpgradeableProxy(address(emptyContract), deployerAddress, "");
        foundryTest = FoundryTest(address(proxyEmptyContract));

        foundryTestImplementation = new FoundryTest();

        console.log("foundryTestImplementation:", address(foundryTestImplementation));
        foundryTestProxyAdmin = ProxyAdmin(getProxyAdminAddress(address(proxyEmptyContract)));

        console.log("foundryTestProxyAdmin:", address(foundryTestProxyAdmin));

        foundryTestProxyAdmin.upgradeAndCall(
            ITransparentUpgradeableProxy(address(foundryTest)), address(foundryTestImplementation), bytes("")
        );

        console.log("deploy proxyEmptyContract:", address(proxyEmptyContract));
        console.log("deploy foundryTestImplementation:", address(foundryTestImplementation));

        string memory path = "./out/deployed_addresses.json";
        string memory data = string(
            abi.encodePacked(
                '{"proxyEmptyContract": "',
                vm.toString(address(proxyEmptyContract)),
                '", ',
                '"foundryTestImplementation": "',
                vm.toString(address(foundryTestImplementation)),
                '"}'
            )
        );
        vm.writeJson(data, path);

        console.log("FoundryTest deployed and upgraded");

        vm.stopBroadcast();
    }

    function getProxyAdminAddress(address proxy) internal view returns (address) {
        address CHEATCODE_ADDRESS = 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D;
        Vm vm = Vm(CHEATCODE_ADDRESS);

        bytes32 adminSlot = vm.load(proxy, ERC1967Utils.ADMIN_SLOT);
        return address(uint160(uint256(adminSlot)));
    }
}
