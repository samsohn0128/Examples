// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

/*
0.6이전의 fallback

fallback 함수는 이름 그대로 대비책 함수 입니다. 

특징 
1. 먼저 무기명 함수, 이름이 없는 함수입니다.
2. external 필수 
3. payable

왜 쓰는가 ?
1. 스마트 컨트랙이 이더를 받을 수 있게 한다.
2. 이더 받고 난 후 어떠한 행동을 취하게 할 수 있다. 
3. call함수로 없는 함수가 불려질때, 어떠한 행동을 취하게 할 수 있다. 


0.6 이전 
function() external payable {
    
}


0.6 이후 fallback 

fallback은 recevie 와 fallback 으로 두가지 형태로 나뉘게 되었습니다.

receive:  순수하게 이더만  받을때 작동 합니다. 
fallback: 함수를 실행하면서 이더를 보낼때, 불려진 함수가 없을 때 작동합니다.


0.6 이후 
기본형 :  불려진 함수가 특정 스마트 컨트랙이 없을때 fallback 함수가 발동 합니다. 
fallback() external {
   
  }

payable 적용시 : 이더를 받고 나서도 fallaback 함수가 발동합니다. 
fallback() external payable {
   
  }

receive() external payable{
    
}

*/

contract Bank {
    event justFallbackWithFunds(address _from, uint256 _value, string message);

    function() external payable {
        emit justFallbackWithFunds(msg.sender, msg.value, "justFallbackWithFunds is called");
    }
}

contract You {
    //receive()
    function depositWithSend(address payable _to) public payable {
        bool success = _to.send(msg.value);
        require(success, "Failed");
    }

    function depositWithTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function depositWithCall(address payable _to) public payable {
        // ~0.7
        (bool sent, ) = _to.call.value(msg.value)("");
        require(sent, "Failed to  send ETH.");
    }

    //fallback()
    function justGiveMessage(address _to) public {
        // ~0.7
        (bool sent, ) = _to.call("Hi");
        require(sent, "Failed to send message");
    }

    function justGiveMessageWithFunds(address payable _to) public payable {
        // ~0.7
        (bool sent, ) = _to.call.value(msg.value)("Hi");
        require(sent, "Failed to send ETH and message");
    }
}