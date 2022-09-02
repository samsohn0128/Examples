// SPDX-License-Identifier: GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec5 {
    // public: 모든 곳에서 접근 가능
    // external: public 처럼 모든 곳에서 접근 가능하나, external이 정의된 자기자신 컨트랙 내에서 접근 불가
    // private: 오직 private이 정의된 자기 컨트랙트에서만 가능(상속 받은 자식도 불가능)
    // internal: private처럼 오직 internal이 정의된 자기 컨트랙트에서만 가능(상속받은 자식도 가능)
    uint256 public a = 5;
    uint256 private a2 = 5;
}

contract Public_example {
    uint256 public a = 3;

    function changeA(uint256 _value) external {
        a = _value;
    }

    function get_a() view external returns(uint256) {
        return a;
    }
}

contract Public_example2 {
    
    Public_example instance = new Public_example();

    function changeA_2(uint256 _value) public {
        instance.changeA(_value);
    }

    function use_public_example_a() view public returns(uint256) {
        return instance.get_a();
    }
}