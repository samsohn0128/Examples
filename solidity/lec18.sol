// SPDX-License-Identifier: GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec18 {
    uint256[] public ageArray;
    uint256[10] public ageFixedSizeArray; //length 10으로 제한
    string[] public nameArray = ["Kal", "John", "Kerri"];

    function ageLength() public view returns(uint256) {
        return ageArray.length;
    }

    function agePush(uint256 _age) public {
        ageArray.push(_age);
    }

    function ageGet(uint256 _index) public view returns(uint256) {
        return ageArray[_index];
    }

    function ageChange(uint256 _index, uint256 _age) public {
        ageArray[_index] = _age;
    }

    function agePop() public {
        ageArray.pop();
    }

    function ageDelete(uint256 _index) public {
        delete ageArray[_index];
    }
}