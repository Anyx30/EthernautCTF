// SPDX-License-Identifier: MIT
/*
You've uncovered an Alien contract. Claim ownership to complete the level.

Things that might help

*Understanding how array storage works
*Understanding ABI specifications
*Using a very underhanded approach
*/
pragma solidity ^0.5.0;

import 'https://github.com/OpenZeppelin/openzeppelin-test-helpers/blob/master/contracts/Ownable.sol';

contract AlienCodex is Ownable {

    bool public contact;
    bytes32[] public codex;

    modifier contacted() {
        assert(contact);
        _;
    }

    function make_contact() public {
        contact = true;
    }

    function record(bytes32 _content) contacted public {
        codex.push(_content);
    }

    function retract() contacted public {
        codex.length--;
    }

    function revise(uint i, bytes32 _content) contacted public {
        codex[i] = _content;
    }
}