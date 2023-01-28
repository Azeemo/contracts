// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

contract implementation
{
    function add(uint a ,uint b) public pure returns(uint)
    {
        return a+b;
    }

    function sub(uint a , uint b) public pure returns(uint)
    {
        return a-b;
    }

    function mul(uint a , uint b) public pure returns(uint)
    {
        return a*b;
    }
}
