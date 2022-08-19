// SPDX-License-Identifier: GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec20 {
    struct Character {
        uint256 age;
        string name;
        string job;
    }

    mapping(uint256=>Character) public characterMapping;
    Character[] public characterArray;

    function createCharacter(uint256 _age, string memory _name, string memory _job) pure public returns(Character memory) {
        return Character(_age, _name, _job);
    }

    function createCharacterMapping(uint256 _key, uint256 _age, string memory _name, string memory _job) public {
        characterMapping[_key] = Character(_age, _name, _job);
    }

    function getCharacterMapping(uint256 _key) public view returns(Character memory) {
        return characterMapping[_key];
    }

    function creatCharaterArray(uint256 _age, string memory _name, string memory _job) public {
        characterArray.push(Character(_age, _name, _job));
    }

    function getCharacterArray(uint256 _index) public view returns(Character memory) {
        return characterMapping[_index];
    }
}