// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "lib/openzeppelin-contracts/contracts/proxy/Proxy.sol";
import "forge-std/console.sol";

// Allowing for upgrades or changes to the implementation (1:1) contract without affecting 
// the contract address or ABI used by clients.
contract OneOfOneProxy is Proxy {
    address immutable _nftImplementation;

    constructor (address nftImplementation){
        _nftImplementation = nftImplementation;
    }

    // overrides prev 1:1 implemenntation
    function _implementation() internal view override returns (address) {
    return _nftImplementation;
    }

    function _beforeFallback() internal virtual override {
    console.log("fallback");
    }
}