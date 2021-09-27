pragma solidity ^0.5.0;

import "./ArcadeTokenMintable_ins_v2.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

contract ArcadeTokenSale is crowdsale, MintedCrowdsale {
    
    constructor(
        uint rate,
        address payable wallet,
        ArcadeToken token
    )
        Crowdsale(rate, wallet, token)
        public
    
    {
        // constructor can stay empty
    }
}


contract ArcadeTokenSaleDeployer {
    address public arcade_sale_address;
    address public token_address;
    
    constructor(
        string memory name,
        string memory symbol,
        address payable wallet
    )
        public
    {
        ArcadeToken token  = new ArcadeToken(name, symbol, 0);
        token_address = address(token);
        
        ArcadeTokenSale arcade_sale = new ArcadeTokenSale(1, wallet, token);
        arcade_sale_address = address(arcade_sale);
        
        token.addMinter(arcade_sale_address);
        token.renounceMinter();
    }
}