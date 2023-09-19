// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract StudentRecords {
    struct Student {
        uint id;
        string name;
        bool a;
            }
        
    mapping(uint=>Student[]) public studentmapping;
    Student[] public student1;
    
    function addStudent(uint _index, uint _id, string memory _name , bool _a) public {
          Student memory newstudent;
          studentmapping[_id].push(newstudent);
          student1[_index]=Student(_id,_name,_a);
             }
             
    function getStudent(uint index) public view returns (Student memory) {
          return student1[index];
    }

    function getStudentDataById(uint Id) public view returns ( string memory, bool) {
          Student[] storage studentsArray = studentmapping[Id];

        for (uint i = 0; i < studentsArray.length; i++) {
            if (studentsArray[i].id == Id) {
                return (studentsArray[i].name, studentsArray[i].a);
            }
        }

        revert("Student not found");
    }
}