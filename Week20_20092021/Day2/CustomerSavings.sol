pragma solidity ^0.5.0;

contract CustomerSavings {
    
    // address payable is an address you can transfer and send ETH 
    // an address that is not payable cannot send ETH
    address payable account_one = 0x66bF885018A1948262266084d6f372c68fE35061;
    address payable account_two = 0x65a52a37885AB21770827202Fe80C89DAd343f5c;
  
  function withdraw(uint amount, address payable recipient) public {
    return recipient.transfer(amount); // transfer is part of the 'payable' package
  }

  function deposit() public payable {} // payable allows you to move ETH around

  function() external payable {} // ensures the smart contract doesn't hold the ETH but rather pays to the addresses from A-to-B

