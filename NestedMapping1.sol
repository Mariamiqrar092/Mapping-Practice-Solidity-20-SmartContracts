// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract NestedMappingExample {
    
    mapping(address => mapping(uint256 => uint256)) public nestedMapping;

    function setValue(address key1, uint256 key2, uint256 value) public {
        nestedMapping[key1][key2] = value;
    }

    function getValue(address key1, uint256 key2) public view returns (uint256) {
        return nestedMapping[key1][key2];
    }
}
