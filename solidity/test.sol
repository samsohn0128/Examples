// SPDX-License-Identifier: GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

function a(uint256 num) pure returns(uint256) {
        return num+1;
    }

contract test {
    uint256 public seoncdsTemp = 1 seconds;
    uint256 public minutesTemp = 1 minutes;
    uint256 public hoursTmep = 1 hours;
    uint256 public daysTemp = 1 days;
    uint256 public weeksTemp = 1 weeks;

    function arithmetic3(uint num1, uint num2)
        public
        pure
        returns (uint, uint)
    {
        return (num1 + num2, num1 * num2);
    }

}