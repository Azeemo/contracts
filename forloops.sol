// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract forloops
{

uint value;

constructor()
{
    value=0;
}

function setvalue(uint _value) public
{
    value=_value;
}

function forloop() public view
{
    for(uint i=0;i<=value;i++)
    {
        console.log("value = ",i);
    }
}

}
