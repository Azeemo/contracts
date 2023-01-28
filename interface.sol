// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;
//0xf8e81D47203A594245E36C48e151709F0C19fBe8
interface arithmetic
{
    function add(uint a , uint b) external pure returns(uint);
    function sub(uint a , uint b) external pure returns(uint);
    function mul(uint a , uint b) external pure returns(uint);
}

contract calling
{
    address addr;
    constructor(address _addr)
    {
        addr=_addr;
    }

    function addition(uint a , uint b) public view returns(uint c)
    {
        c = arithmetic(addr).add(a,b);
    }

    function difference(uint a , uint b) public view returns(uint c)
    {
        c = arithmetic(addr).sub(a,b);
    }

    function multiply(uint a ,uint b) public view returns(uint c)
    {
        c = arithmetic(addr).mul(a,b);
    }
}
