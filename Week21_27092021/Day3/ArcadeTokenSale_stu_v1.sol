pragma solidity ^0.5.0;

// @TODO: Import ArcadeTokenMintable from ./ArcadeTokenMintable_stu_v2.sol

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

contract ArcadeTokenSale is Crowdsale, MintedCrowdsale {

    // @TODO: Build the constructor, passing in the parameters that Crowdsale needs
    constructor(
        uint rate,
        address payable wallet,
        ArcadeToken token
    )
        Crowdsale (rate, wallet, token)
        public
    
}

contract ArcadeTokenSaleDeployer {

    // @TODO: Add public addresses to keep track of the token_address and arcade_sale_address

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet // this address will receive all Ether raised by the sale
    )
        public
    {
        // @TODO: create the ArcadeToken and keep its address handy
        ArcadeToken = new ArcadeToken(name, symbol, 0);
        token_address = address(token);

        // @TODO: create the ArcadeTokenSale and tell it about the token, then keep its address handy
        ArcadeTokenSale arcade_sale = new ArcadeTokenSale(1, wallet, token);
        arcade_sale_address = address(arcade_sale);

        // @TODO: make the ArcadeTokenSale contract a minter, then have the ArcadeTokenSaleDeployer renounce its minter role
        token.addMinter(arcade_sale_address);
        token.renounceMinter();
    }
}