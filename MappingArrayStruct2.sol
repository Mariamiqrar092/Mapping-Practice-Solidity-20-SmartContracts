// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract StudentRecords {
            uint public studentcount;

    struct Student {
        uint id;
        string name;
        bool a;
        uint studentcount;
        }
    Student[2] public student1;
    mapping(address=>Student[] ) public student2;
         
    function addStudent(uint _index, uint _id, string memory _name , bool _a,uint _studentcount) public {
             student1[_index]=Student(_id,_name,_a,_studentcount);
             studentcount++;
             student2 [msg.sender].push (Student(_id, _name,_a, _studentcount));
    
             }
        
    function getStudent(uint index) public view returns (Student memory) {
            return student1[index];
    }

    function getStudentDataById(uint Id) public view returns (uint, string memory, bool,uint) {
        for (uint i = 0; i < student1.length; i++) {
            if (student1[i].id == Id) {
                return (student1[i].id, student1[i].name, student1[i].a,student1[i].studentcount);

                     
            }
        }

        revert("Student not found");
    }
    
//         function getStudentDataById(address studentWallet) public view returns (uint, string memory, bool,uint,address) {
//         for (uint i = 0; i < student1.length; i++) {
//             if (student1[i].Wallet == studentWallet) {
//                 return (student1[i].id, student1[i].name, student1[i].a,student1[i].studentcount,student1[i].Wallet);
//             }
//         }
//                 revert("Student not found");
// }

        }