    // SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 < 0.9.0;
contract constructorpractice
{
    struct student{
        uint studentid;
        string studentname;
        uint studentage;
    }
    mapping (uint=>student) public studentdetails;
    uint public totalstudents;
    constructor (){
        addstudent(1,"Maaz",17);
        addstudent(2, "Mariam", 27);
    }
    
    
    function addstudent(uint _id,string memory _name,uint _age)public {
        require(studentdetails[_id].studentage!=0,"student age cannot be zero");
        student memory newstudent =student (_id,_name,_age);
        studentdetails[_id]=newstudent ;
        totalstudents++;
    }

    function getstudent(uint _id) public view returns(uint,string memory, uint){
               require(studentdetails[_id].studentage!=0,"Student record not fo");

       student memory newstudent1 = studentdetails[_id];
       return (newstudent1.studentid, newstudent1.studentname, newstudent1.studentage);
    }

    function deletestudent(uint _id) public{
        delete studentdetails[_id];
    }
}