// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

contract accessmodifier
{
    address owner;
    constructor()
    {
        owner = msg.sender;
    }

    modifier onlyboss(address addr)
    {
        require(addr == owner , "YOU ARE NOT THE OWNER");
        _;
    }

    function hello() onlyboss(msg.sender) public view returns(string memory)
    {
        return("HELLO WORLD");
    }
}
