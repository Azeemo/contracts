// SPDX-License-Identifier: GPL-3.0-or-later by atul
pragma solidity ^0.8.0;

contract lottery{
    address payable[] public players;
    address public manager;
    constructor(){
        manager=msg.sender;
    }
    receive() payable external{
        require(msg.value==1 ether);
        players.push(payable(msg.sender));
    }
    function getBalance() public view returns(uint){
        require(msg.sender==manager,"you are not the manager");
        return address(this).balance;
    }
    function random() public view returns(uint){
    return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length)));
}

    function pickWinner() public{
        require(msg.sender==manager);
        require(players.length>=3);

        uint r = random();
        address payable winner;
        uint index = r % players.length;
        winner = players[index];
        winner.transfer(getBalance());
        players = new address payable[](0);
    }

    // function hashfunction(string memory text,uint num,address aa)public pure returns(){
    //     return keccak256(abi.encodePacked(text,num,aa));
    // }
}
