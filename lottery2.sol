// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

contract Lottery {
    address payable[] public players;
    address public manager;
    uint public ticketPrice;
    uint public minimumPlayers;
    uint public maximumPlayers;
    bool public isLotteryOpen;
    bool public isLotteryFinished;
    uint private seed;
    
    event NewPlayer(address player);
    event LotteryStarted();
    event LotteryFinished(address winner, uint payout);

    constructor(uint _ticketPrice, uint _minimumPlayers, uint _maximumPlayers) {
        manager = msg.sender;
        ticketPrice = _ticketPrice;
        minimumPlayers = _minimumPlayers;
        maximumPlayers = _maximumPlayers;
        isLotteryOpen = false;
        isLotteryFinished = false;
        seed = 0;
    }
    
    receive() external payable {
        require(isLotteryOpen, "The lottery is not open for ticket purchases.");
        require(msg.value == ticketPrice, "The ticket price is not correct.");
        require(players.length < maximumPlayers, "The maximum number of players has been reached.");
        require(!_isPlayer(msg.sender), "You have already purchased a ticket.");
        
        players.push(payable(msg.sender));
        emit NewPlayer(msg.sender);
    }
    
    function startLottery() public {
        require(msg.sender == manager, "Only the manager can start the lottery.");
        require(players.length >= minimumPlayers, "The minimum number of players has not been reached.");
        require(!isLotteryOpen, "The lottery has already started.");
        
        isLotteryOpen = true;
        seed = uint(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)));
        emit LotteryStarted();
    }
    
    function endLottery() public {
        require(msg.sender == manager, "Only the manager can end the lottery.");
        require(isLotteryOpen, "The lottery has not started yet.");
        require(!isLotteryFinished, "The lottery has already ended.");
        
        isLotteryOpen = false;
        isLotteryFinished = true;
        
        uint winningIndex = seed % players.length;
        address payable winner = players[winningIndex];
        uint payout = address(this).balance;
        winner.transfer(payout);
        emit LotteryFinished(winner, payout);
        
        _resetLottery();
    }
    
    function _resetLottery() private {
        for (uint i = 0; i < players.length; i++) {
            players[i] = payable(0x0);
        }
        players = new address payable[](0);
        seed = 0;
        isLotteryFinished = false;
    }
    
    function getBalance() public view returns (uint) {
        require(msg.sender == manager, "You are not the manager.");
        return address(this).balance;
    }
    
    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }
    
    function _isPlayer(address _player) private view returns (bool) {
        for (uint i = 0; i < players.length; i++) {
            if (players[i] == _player) {
                return true;
            }
        }
        return false;
    }
}
