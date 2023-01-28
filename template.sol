// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.17;

contract template
{

uint value;

constructor()
{
    value=0;
}

function setvalue(uint _val) public
{
    value = _val;
}

function getvalue() public view returns(uint )
{
    return value;
}
}
