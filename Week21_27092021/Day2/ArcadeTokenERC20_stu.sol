pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";

contract ArcadeToken is ERC20, ERC20Detailed {
    address payable owner;
    
    // Allows is to restrict our other functions in the same way that we set them to public or payable
    // _ tells Solidity to return tot he function that called the modifier 
    modifier onlyOwner {
        require(msg.sender == owner, "You do not have permission to mint these tokens!");
        _;
    }

    // ERC20Detailed constructor (string memory name, string memory symbol, uint8 decimals) public
    // show gretter functions private v public
    constructor(uint initial_supply) ERC20Detailed("TriCoin", "TRC", 18) public {
        owner = msg.sender;
        _mint(owner, initial_supply); //mint with the address and the amount you want to mint
    }

    function mint(address recipient, uint amount) public onlyOwner {
        _mint(recipient, amount);
    }
}