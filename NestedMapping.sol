// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract nestedmapping{

mapping(uint=>mapping(uint=>bool)) public table;

    function adddata(uint row, uint coloumn, bool value) public{
        table[row][coloumn]=value;
    }

    function returndata (uint row,uint coloumn) public view returns(bool){
        return table[row][coloumn];
    }
}