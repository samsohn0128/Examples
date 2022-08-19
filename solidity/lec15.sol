// SPDX-License-Identifier: GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract Father {
    event fatherName(string name);

    function who() public virtual {
        emit fatherName("KimDaeho");
    }
}

contract Son is Father {
    event sonName(string name);

    function who() public override {
        // emit FatherName("KimDaeho");
        super.who();
        emit sonName("KimJin");
    }
}