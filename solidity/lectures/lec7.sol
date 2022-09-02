// SPDX-License-Identifier: GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec7 {
    /*
    storage: 대부분의 변수, 함수들이 저장되며, 영속적으로 저장되어 가스비가 비쌈
    memory: 함수의 파라미터, 리턴값, 레퍼런스 타입이 주로 저장, storage와 달리 영속적이지 않고, 함수내에서만 유효하여 storage보다 가스비가 쌈
    Colldata: 주로 external function의 파라미터에서 사용
    stack: EVM(Ethereum Virtual Machine)에서 stack data를 관리할 때 쓰는 영역, 1024MB로 제한적
    */

    // function -string -> string은 기본 데이터 타입이 아니므로 레퍼런스 -> 함수내에서만 사용할 경우 memory라고 명시적으로 써줘야함
    function get_string(string memory _str) public pure returns(string memory) {
        return _str;
    }

    // fucntion - uint256 -> uint256은 기본 데이터 타입이므로 함수 내에서만 사용하는 경우 자동으로 memory 공간에 저장
    function get_string(uint256 _ui) public pure returns(uint256) {
        return _ui;
    }
}