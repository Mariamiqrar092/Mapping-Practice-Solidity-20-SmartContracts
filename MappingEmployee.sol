// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract EmployeeManagement {
    struct Employee {
        uint id;
        string name;
        uint256 age;
        uint256 salary;
    }

    mapping(uint256 => Employee) public employees;

    uint256 public totalEmployees;

    function addEmployee(uint256 _id, string memory _name, uint256 _age, uint256 _salary) public {
        require(employees[_id].id == 0, "Employee with this ID already exists");

        employees[_id] = Employee(_id, _name, _age, _salary);
        totalEmployees++;
    }

    function getEmployee(uint256 _id) public view returns (uint256 id, string memory name, uint256 age, uint256 salary) {
        require(employees[_id].id != 0, "Employee with this ID does not exist");

        return (employees[_id].id, employees[_id].name, employees[_id].age, employees[_id].salary);
    }

    function updateSalary(uint256 _id, uint256 _newSalary) public {
        require(employees[_id].id != 0, "Employee with this ID does not exist");

        employees[_id].salary = _newSalary;
    }
}
