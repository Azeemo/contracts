// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

contract pocket
{
    mapping(address=>uint) balances;

    function setbalance(address addr,uint _value) public
    {
        balances[addr]=_value;
    }

    function getbalance(address addr) public view returns(uint)
    {
        return balances[addr];
    }
}
