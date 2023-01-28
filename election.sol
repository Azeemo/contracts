// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

contract Election
{

struct candidate
{
    uint id;
    string name;
    uint votecount;
}

uint candidcount;
uint candidid;
address owner;
mapping(address=>bool) voted;
mapping(uint=>candidate) public candidates;
event vote(address indexed voter , uint indexed candidid);


constructor()
{

    owner=msg.sender;
    candidcount=3;

}

function addCandidate(string memory _name) public
{
    require(msg.sender==owner,"You Are Not Owner");
    candidid++;
    candidates[candidid]=candidate(candidid,_name,0);
    require(candidid<=candidcount , "NO more candidate can be added"); 

} 

function voteCandidate(uint _id) public 
{

    require(!voted[msg.sender],"Already Voted");
    require(candidid<=candidcount , "ID can't be more than threshold");
    require(candidates[_id].id!=0 , "candidate not found");  
    voted[msg.sender]=true;
    candidates[_id].votecount++;
    emit vote(msg.sender,_id);

}

function winner() public view returns(string memory name, uint id)
{
require((candidates[1].votecount != candidates[2].votecount) && 
        (candidates[1].votecount != candidates[3].votecount) && 
        (candidates[2].votecount != candidates[3].votecount),"ELECTION DRAW");
    if(candidates[1].votecount>candidates[2].votecount && candidates[1].votecount>candidates[3].votecount)
    {
        name=candidates[1].name;
        id=candidates[1].id;
    }
    else if(candidates[2].votecount>candidates[3].votecount)
    {
        name=candidates[2].name;
        id=candidates[2].id;
    }
    else if(candidates[3].votecount>0)
    {
        name=candidates[3].name;
        id=candidates[3].id;
    }
    else
    {
        revert("Election Draw");
    }
}

}
