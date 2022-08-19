// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract lec22 {
    event countryIndexName(uint256 indexed _index, string _name);
    string[] private countryList = ["South Korea", "North Korea", "USA", "China", "Japan"];

    function forLoopEvents() public {
        for(uint256 i = 0; i < countryList.length; i++) {
            emit countryIndexName(i, countryList[i]);
        }
    }

    function whileLoopEvents() public {
        uint256 i = 0;
        while (i < countryList.length) {
            emit countryIndexName(i, countryList[i]);
            i++;
        }
    }

    function doWhileLoopEvents() public {
        uint256 i = 0;
        do {
            emit countryIndexName(i, countryList[i]);
            i++;
        } while (i < countryList.length);
    }
}