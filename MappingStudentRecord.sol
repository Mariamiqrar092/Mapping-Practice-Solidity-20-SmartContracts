// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 < 0.9.0;

contract StudentRecords {
    struct Student {
        uint256 id;
        string name;
        uint256 age;
    }

    mapping(uint256 => Student) private students;

    function addStudent(uint256 id, string memory name, uint256 age) external {
        Student memory newStudent = Student(id, name, age);
        students[id] = newStudent;
    }

    function getStudent(uint256 id) external view returns (string memory, uint256) {
        Student memory student = students[id];
        return (student.name, student.age);
    }
}
