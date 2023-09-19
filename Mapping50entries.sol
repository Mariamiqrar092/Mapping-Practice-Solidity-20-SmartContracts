// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract StudentRecords {
    struct Student {
        string name;
        uint age;
    }
    
    mapping(uint => Student) public students; 
    uint public totalStudents; 
    
    function addStudent(uint _id, string memory _name, uint _age) public {
        require(totalStudents < 50, "Maximum number of students reached");
        require(students[_id].age == 0, "Student with the same ID already exists");
        
        Student memory newStudent = Student(_name, _age);
        students[_id] = newStudent; 
        totalStudents++;
    }
    
    function getStudent(uint _id) public view returns (string memory, uint) {
        require(students[_id].age != 0, "Student record not found");
        Student memory student = students[_id];
        return (student.name, student.age); 
    }
}