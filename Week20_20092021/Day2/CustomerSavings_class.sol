pragma solidity ^0.5.0;

contract CustomerSavings {
    
    // address payable is an address you can transfer and send ETH 
    // an address that is not payable cannot send ETH
    address payable account_one = 0x66bF885018A1948262266084d6f372c68fE35061;
    address payable account_two = 0x65a52a37885AB21770827202Fe80C89DAd343f5c;
    
    uint public balanceContract;
  
  // transfer is part of the 'payable' package
  function withdraw(uint amount, address payable recipient) public {
    recipient.transfer(amount); 
    balanceContract = address(this).balance;
  }
  
  // payable allows you to move ETH around
  function deposit() public payable {
      balanceContract = address(this).balance;
  } 

  function() external payable {} // for you to get your money back 
  
}
