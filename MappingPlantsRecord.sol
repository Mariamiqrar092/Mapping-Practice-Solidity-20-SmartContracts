// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract GreenTown{
    struct plants{
        string plantname;
        uint plantprice;
        uint plantquantity;
    }

      mapping(uint=>plants) public leaves;

      function addplant(uint _id,string memory _pname,uint _pprice,uint _pquantity)public{
          plants memory newplant =plants(_pname,_pprice,_pquantity);
          leaves[_id]=newplant;

      } 
function getplant(uint _id) public view returns (string memory,uint,uint){
    plants memory Gplant= leaves [_id];
    return (Gplant.plantname,Gplant.plantprice,Gplant.plantquantity);
} 
    function updateplant( uint _id,string memory _pname,uint _pprice,uint _pquantity)public {
        leaves[_id].plantname=_pname;
        leaves[_id].plantprice=_pprice;
        leaves[_id].plantquantity=_pquantity;




    }
    function deleteplant(uint _id)public{
        delete leaves[_id];
    } 

}