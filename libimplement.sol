// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

import './lib.sol';

contract libr
{
    using lib for uint;

    function addition(uint a , uint b) public pure returns(uint)
    {
        return a.add(b);
    }

    function addModulo(uint a ,uint b ,uint c) public pure returns(uint)
    {
        return a.addMod(b,c);
    }   
        
}
