// SPDX-License-Identifier: GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec3 {
    //1 ether = 10^9 gwei = 10^18 wei
    //0.000000000000000001 ether = 1^-18 = 1 wei
    //Ethereum Yello Paper: https://ethereum.github.io/yellowpaper/paper.pdf
    
    uint256 public value = 1 ether;
    uint256 public value2 = 1 wei;
    uint256 public value3 = 1 gwei;
}