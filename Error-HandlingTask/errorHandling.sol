// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ErrorHandling {

    uint8 public ind;

    error NotAllowedInYet(bytes amount);

    function adultsOnly(uint8 _age) public returns(string memory) {
        // require statement in action
        require(_age > 18, "Only for ADULTS!!!");
        ind = _age;
        return "Enjoy";
    }

    function childrenCorner(uint8 _age) public returns(uint8) {
        // revert() is used when the condition is complex.
        if (_age > 10) {
            revert("Only childrn are allowed here");
        }
        return ind = _age;
    }

    function assertChildren(uint8 _input) public view {
        assert(ind < _input);
    }

    function useCustomError(uint8 _amount) public view {
        // revert used internally to handle errors
        if (ind < _amount) {
            revert NotAllowedInYet({amount: abi.encode(_amount)});
        }
    }
}
