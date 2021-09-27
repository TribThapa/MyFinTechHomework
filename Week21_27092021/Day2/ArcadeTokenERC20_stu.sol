pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";

contract ArcadeToken is ERC20, ERC20Detailed {
    address payable owner;

    modifier onlyOwner {
        // @TODO: add a `require` to check if `owner` is the `msg.sender`
        require (owner == msg.sender, "You are not the owner!");
        
        _; // this underscore sends us back to the function that called this modifier
    }

    // @TODO: Pass the required parameters to `ERC20Detailed`
    constructor(uint initial_supply) ERC20Detailed("ArcadeToken", "ARCD", 18) public {
        // @TODO: Set the owner to be `msg.sender`
        owner = msg.sender;

        // @TODO: Call the internal `_mint` function to give `initial_supply` to the `owner`
        _mint(owner, initial_supply);
    }

    // @TODO: Add the `onlyOwner` modifier to this function after `public`
    function mint(address recipient, uint amount) public {
        // @TODO: Call the internal `_mint` function and pass the `recipient` and `amount` variables
        _mint(recipient, amount);
    }
}
