// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {
    address public admin;
    
    struct Student {
        uint256 rollNumber;
        string name;
        uint256 age;
    }
    
    mapping(address => Student) private students;
    address[] private studentAddresses;

    event StudentAdded(address indexed studentAddress, uint256 rollNumber, string name, uint256 age);

    constructor() {
        admin = msg.sender;
    }
    
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can access this function.");
        _;
    }

    function addStudent(uint256 _rollNumber, string memory _name, uint256 _age) public {
        require(students[msg.sender].rollNumber == 0, "Student already exists");
        
        Student memory newStudent = Student(_rollNumber, _name, _age);
        students[msg.sender] = newStudent;
        studentAddresses.push(msg.sender);
        
        emit StudentAdded(msg.sender, _rollNumber, _name, _age);
    }

    function getStudentData() public view returns (uint256, string memory, uint256) {
        Student memory student = students[msg.sender];
        return (student.rollNumber, student.name, student.age);
    }
    
    function getAllStudentData() public view onlyAdmin returns (Student[] memory) {
        uint256 studentCount = studentAddresses.length;
        Student[] memory allStudents = new Student[](studentCount);
        
        for (uint256 i = 0; i < studentCount; i++) {
            allStudents[i] = students[studentAddresses[i]];
        }
        
        return allStudents;
    }
}
