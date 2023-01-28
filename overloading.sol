// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract contract1
{
    function hello() public view
    {
        console.log("HELLO from contract 1");
    }
}

contract contract2 is contract1
{
    function hello(string memory str) public view 
    {
        console.log("HELLO from contract 2",str);
    }
}
