// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;
contract studentR
{
    struct student{
        string name;
        string class;
        uint marks;
    }
    mapping (uint=>student) public data;

    function setter (uint _roll, string memory _name, string memory _class, uint _marks) public
 {   
      data[_roll]= student(_name, _class, _marks);
}
}