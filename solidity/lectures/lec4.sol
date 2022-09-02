// SPDX-License-Identifier: GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec4{

    //1. a function without Parameter and Return
    uint256 public a = 3;
    function changeA1() public {
        a = 5;
    }

    //2. a function with Parameter without Return
    function changeA2(uint256 _value) public {
        a = _value;
    }

    //3. a function with Parameter and Return
    function changeA3(uint256 _value) public returns(uint256) {
        a = _value;
        return a;
    }
}