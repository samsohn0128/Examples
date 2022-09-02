// SPDX-License-Identifier: GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract Father {
    event fatherName(string name);
    
    function who() public virtual {
        emit fatherName("KimDaeho");
    }
}

contract Mother {
    event motherName(string name);

    function who() public virtual {
        emit motherName("LeeSol");
    }
}

contract Son is Father, Mother{ // -> Mother이 가장 최신
    function who() public override(Father, Mother) {
        super.who();
    }
}