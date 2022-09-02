// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

/*
call :로우레벨 함수 
1. 송금하기
2. 외부 스마트 컨트랙 함수 부르기 
3. 가변적인 gas
4. 이스탄불 하드포크, 2019년 12월이후, gas 가격 상승에 따른,  call 사용 권장/ send tranfer = 2300gas 
5. re-entrancy(재진입) 공격위험 있기에, Checks_Effects_Interactions_pattern 사용  
*/

contract add {
    event justFallback(string _str);
    event justReceive(string _str);

    function addNumber(uint256 _num1, uint256 _num2) public pure returns(uint256) {
        return _num1 + _num2;
    }

    fallback() external payable{
        emit justFallback("justFallback is called");
    }

    receive() external payable {
        emit justReceive("justReceive is called");
    }
}

contract caller {
    event calledFunction(bool _success, bytes _output);

    // 1. transfer -> receive
    function transferEther(address payable _to) public payable {
        (bool success, ) = _to.call{value:msg.value}("");
        require(success, "failed to transfer ether.");
    }

    // 2. call a method of the external smart contract
    //abi.encodeWithSignature의 큰따옴표 안에 띄어쓰기 금지
    function callMethod(address _contractAddr, uint256 _num1, uint256 _num2) public {
        (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call(
            abi.encodeWithSignature("addNumber(uint256,uint256)", _num1, _num2)
            );
        require(success, "failed to call the function");
        emit calledFunction(success, outputFromCalledFunction);
    }

    // 3. call a wrong method of the external smart contract -> fallback
    function callWrongMethod(address _contractAddr) public payable {
        (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call{value: msg.value}(
            abi.encodeWithSignature("Nothing()")
            );
        require(success, "failed to transfer ether.");
        emit calledFunction(success, outputFromCalledFunction);
    }
}