// SPDX-License-Identifier: None
pragma solidity ^0.8.20;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    address ownerAddress = msg.sender;
    uint256 amount = type(uint256).max;
    // string constant name = "BellCR";
    // string constant symbol = "BCR";

    constructor(string memory name, string memory symbol) ERC20(name, symbol){

        _mint(address(this), amount * (10e18));
    }

   function mintToken(uint _amount, address receiver)public {
    require(msg.sender == ownerAddress, "Not_authorized");
            _mint(receiver, _amount * (10e18));
   }
    function burnToken(uint _amount)public{
        _burn(msg.sender, _amount);
    }
}
