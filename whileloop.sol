// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract whileloops
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

function whileloop() public view
{
    uint i = 0;
    while( i<=value)
    {
        console.log("value = ",i);
        i++;
    }
}

}
