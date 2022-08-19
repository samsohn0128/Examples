
// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.8.0;

import "./lec41_1.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v3.x/contracts/math/SafeMath.sol";

contract lec41 is HiSolidity {
    using SafeMath for uint8;

    uint256 public a;
    uint256 public maximum = 2**256 - 1;

    function becomeOverflow(uint8 _num1, uint8 _num2) public {
        a = _num1.add(_num2);
    }
}