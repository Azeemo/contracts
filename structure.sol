// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

contract marksheet
{
    struct student
    {
        uint rollno;
        string name;
        uint marks;

    }
    student s;

    mapping(uint=>student) studentdetail;

    function filldata(uint _rollno , string memory _name , uint _marks) public
    {
        studentdetail[_rollno].rollno= _rollno;
        studentdetail[_rollno].name=_name;
        studentdetail[_rollno].marks=_marks;

    }

    function getmarksheet(uint _rollno) public view returns(uint rollno ,string memory name , uint marks)
    {
        rollno=studentdetail[_rollno].rollno;
        name=studentdetail[_rollno].name;
        marks=studentdetail[_rollno].marks;
    }
}
