// SPDX-License-Identifier: GPL-3.0

pragma solidity >=  0.5.0 < 0.9.0;

contract MyContract {
    struct MyStruct {
        uint variable1;
        uint variable2;
    }

    mapping(uint => MyStruct[]) public myStructMapping;

    function addStructInstance(uint key, uint _var1, uint _var2) public {
        MyStruct memory newStruct = MyStruct(_var1, _var2);
        myStructMapping[key].push(newStruct);
    }

    function getStructInstances(uint key) public view returns (MyStruct[] memory) {
        return myStructMapping[key];
    }
}
