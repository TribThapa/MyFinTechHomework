pragma solidity ^0.5.0;

contract JointSavings {
  address payable account_one = 0xc3879B456DAA348a16B6524CBC558d2CC984722c;
  address payable account_two = 0xA29f7E79ECEA4cE30DD78cfeb9605D9aFf5143a5;
  
  address public last_to_withdraw;
  uint public last_to_withdraw_block;
  uint public last_to_withdraw_amount;
  
  address public last_to_deposit;
  uint public last_deposit_amount;
  uint public last_deposit_block;

    
  function withdraw(uint amount, address payable) public {
    require(msg.sender == account_one || msg.sender == account_two, "You don't own this account!");
    msg.sender.transfer(amount);
    
    if (last_to_withdraw != msg.sender){
        last_to_withdraw = msg.sender;
    }
    
    last_withdraw_amount = amount;
    last_withdraw_block = block.number;
  }

  function deposit() public payable {
      if (last_to_deposit != msg.sender){
          last_to_deposit = msg.sender;
      }
      
      last_deposit_amount = msg.value;
      last_deposit_block = block.number;
      
  }

  function() external payable {}