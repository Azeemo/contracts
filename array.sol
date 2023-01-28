// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

contract array
{
    uint256[] numbers;

    constructor()
    {
        numbers=[1,2,3,4];
    }

    function getarray() public view returns(uint256[] memory)
    {
        return numbers;
    }
}
