// SPDX-License-Identifier: None
pragma solidity ^0.8.20;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    address owner;
    uint256 amount = type(uint256).max;
    // string constant name = "BellCR";
    // string constant symbol = "BCR";

    constructor(string memory name, string memory symbol) ERC20(name, symbol){
        
        owner = msg.sender;


        _mint(address(this), amount * (10e18));
    }

   function mintToken(uint _amount, address receiver) public {
    require(msg.sender == owner, "Not_authorized");
            _mint(receiver, _amount * (10e18));
   }
   
   function transfer(uint256 _amount, address _receiver) public {
        _transfer(msg.sender, _receiver, _amount);
    } 
    function burnToken(uint _amount)public{
        _burn(msg.sender, _amount);
    }

}