// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    enum assets{burger, shield, power, viel}

    constructor() ERC20("Degen", "DGN") {}

    function mint(address to, uint256 amount) public onlyOwner {
            _mint(to, amount);
    }

    function spendToken(assets _needed, uint amount) public returns (bool) {
        if (_needed == assets.burger){
            _transfer(msg.sender, address(this), amount);
        } else if (_needed == assets.shield){
            _transfer(msg.sender, address(this), amount);
        } else if (_needed == assets.power){
           _transfer(msg.sender, address(this), amount);
        } else if (_needed == assets.viel){
            _transfer(msg.sender, address(this), amount);
        }
        return true;
    }

    function burntoken(uint amount) public {
        _burn(msg.sender, amount);
    }
}
