// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

library lib
{
    function add(uint a , uint b) external pure returns(uint)
    {
        return a+b;
    }

    function addMod(uint a ,uint b , uint c) external pure returns(uint)
    {
        return addmod(a,b,c);
    }
}
