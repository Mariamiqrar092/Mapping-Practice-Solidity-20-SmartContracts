// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 < 0.9.0;


contract StudentRegistry {
    struct Student {
        uint studentId;
        string name;
        uint age;
    }

    mapping(uint => Student[]) private studentsMapping;

    function addStudent(uint _studentId, string memory _name, uint _age) public {
        Student memory newStudent = Student(_studentId, _name, _age);
        studentsMapping[_studentId].push(newStudent);
    }

    function getStudentById(uint _studentId) public view returns (string memory, uint) {
        Student[] storage studentsArray = studentsMapping[_studentId];
        for (uint i = 0; i < studentsArray.length; i++) {
            if (studentsArray[i].studentId == _studentId) {
                return (studentsArray[i].name, studentsArray[i].age);
            }
        }
        
        revert("Student not found");
    }

    // Function to retrieve the number of students for a specific student ID
    function getNumberOfStudents(uint256 _studentId) public view returns (uint256) {
        return studentsMapping[_studentId].length;
    }
}
