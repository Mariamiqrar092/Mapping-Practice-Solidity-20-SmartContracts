// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;
contract showroom{
    struct cars{
        uint id;
        string name;
        string color;
        uint price;
    }
mapping (uint=>cars)public cardetails;
uint totalcars;

function addcar (uint _id,string memory _name,string memory _color,uint _price)public {
    require(cardetails[_id].id==0 ,"invalid id");
    cardetails[_id]=cars(_id,_name,_color,_price);


}
function getcar(uint _id)public view returns (uint id,string memory name, string memory color,uint price) {
        require(cardetails[_id].id!=0 ,"invalid id");
        return (cardetails[_id].id , cardetails[_id].name,cardetails[_id].color,cardetails[_id].price); 


    
}
function updateprice(uint _id,uint _newprice)public {
        require(cardetails[_id].id!=0 ,"invalid id");
        cardetails[_id].price=_newprice;


    
}
}