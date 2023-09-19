// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 < 0.9.0;
contract Store{
    struct product{
        string ProductName;
        string ProductColour;
        uint ProductPrice;
        uint ProductQuantity;

    }
    mapping (uint=>product)public Data;
    function AddProduct(uint _id,string memory _productname,string memory _productcolour,uint  _productprice,uint _productquantity)public {
product memory newproduct = product(_productname,_productcolour,_productprice,_productquantity);
   Data[_id]=newproduct;

    }
    function GetProduct(uint _id)public view returns(string memory ,string memory ,uint ,uint ){       
    product memory productsget = Data [_id];
    return (productsget.ProductName,productsget.ProductColour,productsget.ProductPrice,productsget.ProductQuantity);
    }
    function updateproduct(uint _id,string memory _productname,string memory _productcolour,uint  _productprice,uint _productquantity)public{
        Data[_id].ProductName=_productname;
        Data[_id].ProductColour=_productcolour;
        Data[_id].ProductPrice=_productprice;
        Data[_id].ProductQuantity=_productquantity;
    }
    function deleteproduc(uint _id)public {
        delete Data[_id];
    }
}