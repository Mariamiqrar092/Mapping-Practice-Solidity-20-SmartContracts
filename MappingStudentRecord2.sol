// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 < 0.9.0;
contract SchoolRecord {
    struct Student {
        uint id;
        string name;
        uint age;
        string grade;
    }

    mapping(uint => Student) private students;

    function addStudent(uint _id, string memory _name, uint _age, string memory _grade) public {
        require(students[_id].id == 0, "Student with the same ID already exists.");
        
        students[_id] = Student(_id, _name, _age, _grade);
    }

    function getStudent(uint _id) public view returns (uint, string memory, uint, string memory) {
        require(students[_id].id != 0, "Student with the given ID does not exist.");

        Student memory student = students[_id];
        return (student.id, student.name, student.age, student.grade);
    }

    function updateStudent(uint _id, string memory _name, uint _age, string memory _grade) public {
        require(students[_id].id != 0, "Student with the given ID does not exist.");

        students[_id].name = _name;
        students[_id].age = _age;
        students[_id].grade = _grade;
    }

    function deleteStudent(uint _id) public {
        require(students[_id].id != 0, "Student with the given ID does not exist.");

        delete students[_id];
    }
}
