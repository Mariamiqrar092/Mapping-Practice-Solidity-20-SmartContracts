// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {
    address public owner;

    struct Student {
        uint id;
        string name;
        uint256 age;
        bool a;
        string major;
        bool exists;
    }

    mapping(address => Student) private  students;
    address[] private studentAddresses;

    event StudentRegistered(address indexed studentAddress, uint id, string name, uint256 age, bool a, string major);

  constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can execute this.");
        _;
    }

    function addStudent(uint _id, string memory _name, uint256 _age, bool _a, string memory _major, bool _exists) public  {
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(_age > 0, "Age must be greater than zero");
        require(bytes(_major).length > 0, "Subject cannot be empty");
        require(!students[msg.sender].exists, "Student data already registered.");
                require(students[msg.sender].id == 0, "Student already exists");

 
        Student memory newStudent = Student(_id, _name, _age,_a,_major,_exists);
        students[msg.sender] = newStudent;
        studentAddresses.push(msg.sender);
        
        emit StudentRegistered(msg.sender, _id, _name, _age,_a,_major);
    }


    function getStudentData() public  view returns (uint id,string memory name, uint256 age, bool a, string memory major) {
        Student memory student = students[msg.sender];
        return (student.id, student.name, student.age, student.a, student.major);
    }
       
    function getAllStudentData() public view onlyOwner returns (Student[] memory) {
        uint256 studentCount = studentAddresses.length;
        Student[] memory allStudents = new Student[](studentCount);
        
        for (uint256 i = 0; i < studentCount; i++) {
            allStudents[i] = students[studentAddresses[i]];
        }
        
        return allStudents;
    }

}