// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

//import "hardhat/console.sol";

contract FrontCraft {
    string public name;
    uint256 public remains;
    address payable public defaultAdd;

    function Deposit(uint256 _amount, string calldata _name) public payable returns(uint256){
        uint _previousremains = remains;
        name = _name;
        remains = remains + _amount;
        assert(remains == _previousremains + _amount); //to ensure tx success
        emit stakeSome(_amount);
        return remains;
    }

    function Withdrawal(uint256 _comotKudiAmount, string calldata _name) public returns(uint256){ 
        uint _previousremains = remains;
        if (remains < _comotKudiAmount) {
            revert Insufficientremains({
                remains: remains,
                comotKudiAmount: _comotKudiAmount
            });
        }
        remains -= _comotKudiAmount;
        name  = name;
        assert(remains == (_previousremains - _comotKudiAmount));
        emit comotKudi(_comotKudiAmount);
        return remains;
    }

    event stakeSome(uint256 indexed amount);
    event comotKudi(uint256 indexed amount);
    error Insufficientremains(uint256 remains, uint256 comotKudiAmount);

}
    