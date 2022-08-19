// SPDX-License-Identifier: GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract A {
    string public name;
    uint256 public age;

    constructor(string memory _name, uint256 _age) {
        name =_name;
        age = _age;
    }

    function change(string memory _name, uint256 _age) public {
        name = _name;
        age = _age;
    }
}

contract B {
    //instance를 이용해서 contract A를 다 가져온다면 가스비가 매우 많이 듬
    //한 블록당 사용할 수 있는 가스비가 제한적이라 배포가 불가능해질 수도 있음 -> clone factory pattern
    A instance = new A("Alice", 52);

    function change(string memory _name, uint256 _age) public {
        instance.change(_name, _age);
    }

    function get() public view returns(string memory, uint256) {
        return (instance.name(), instance.age());
    }
}