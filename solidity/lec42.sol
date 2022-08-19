// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

/*
MoneyBox Rules
1. 1 이더만 내야한다
2. 중복해서 참여 불가 (단, 누군가 적립금을 받으면 초기화)
3. 관리자만 적립된 이더 볼 수 있다.
4. 3의 배수 번째 사람에게만 적립된 이더를 준다.
*/

contract MoneyBox {
    event whoPaid(address indexed sender, uint256 payment);

    address owner;

    mapping(uint256 => mapping(address => bool)) paidMemberList;
    uint256 round = 1;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        require(msg.value == 1 ether, "Must be 1 ether");
        require(paidMemberList[round][msg.sender] == false, "Must be a new player in each game.");
        
        paidMemberList[round][msg.sender] = true;
        emit whoPaid(msg.sender, msg.value);

        if(address(this).balance == 3 ether) {
            (bool sent, ) = payable(msg.sender).call{value:address(this).balance}("");
            require(sent, "Failed to pay");
            round++;
        }
    }

    function checkRound() public view returns(uint256) {
        return round;
    }

    function checkValue() public view returns(uint256) {
        require(owner == msg.sender, "Only owner can check the value");
        return address(this).balance;
    }
}