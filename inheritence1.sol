// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract contract1
{
    function hello1() public view
    {
        console.log("HELLO from contract 1");
    }
}

contract contract2 is contract1
{
    function hello2() public view
    {
        console.log("HELLO from contract 2");
    }
}

contract contract3 is contract2
{
    function hello3() public view
    {
        console.log("HELLO from contract 3");
    }
}
