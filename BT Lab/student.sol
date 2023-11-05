// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    // Define a structure to represent student data
    struct Student {
        uint256 id;
        string name;
        uint256 age;
    }
    string public calledFallbackFun;

    // Array to store student records
    Student[] public students;

    // Constructor to initialize the contract
    constructor() {
        // You can initialize the contract with some default data if needed
    }

    // Function to add a new student
    function addStudent(uint256 _id, string memory _name, uint256 _age) public {
        Student memory newStudent = Student(_id, _name, _age);
        students.push(newStudent);
    }

    // Function to get the number of students
    function getStudentCount() public view returns (uint256) {
        return students.length;
    }

    // Function to get the details of a specific student
    function getStudent(uint256 index) public view returns (uint256, string memory, uint256) {
        require(index < students.length, "Student does not exist");
        Student storage student = students[index];
        return (student.id, student.name, student.age);
    }
    // Fallback function to receive Ether
    receive() external payable {
        calledFallbackFun="Fallback function is executed!";
        // You can implement custom logic here for handling Ether sent to the contract.
        // For example, you could log the sender's address and the amount received.
    }
}
