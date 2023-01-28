// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

contract enumm
{
    enum ON_OFF
    {
        ON,
        OFF
    }
    ON_OFF on_off;

    function setenum() public 
    {
        on_off = ON_OFF.OFF;
        //ON = 0
        //OFF = 1
    }

    function getenum() public view returns(ON_OFF)
    {
        return on_off;
    }
}
