// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 < 0.9.0;

contract project{
    struct student{
        string name;
        uint class;
        string teacher;
    }

mapping (uint=>student) public data;

function setter (uint _roll, string memory _name,uint _class, string memory _teacher)public 
{
    data [_roll]= student (_name, _class, _teacher);

  }
}
