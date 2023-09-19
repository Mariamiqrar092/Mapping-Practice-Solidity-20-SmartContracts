// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract StudentRegistry {
    struct Student {
        string name;
        uint256 age;
        string interest;
    }

    mapping(address => mapping(uint256 => Student)) private studentData;

    function addStudentData(uint256 studentId, string memory name, uint256 age, string memory interest) public {
        studentData[msg.sender][studentId] = Student(name, age, interest);
    }

    function getStudentData(uint256 studentId) public view returns (string memory, uint256, string memory) {
        Student memory student = studentData[msg.sender][studentId];
        return (student.name, student.age, student.interest);
    }
}