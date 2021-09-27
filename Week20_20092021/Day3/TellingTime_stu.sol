pragma solidity ^0.5.0;

contract JointSavings {
  address payable account_one = 0xcC7EbAAaA14dFb82eEE14aEd6D9B7139f601941D;
  address payable account_two = 0x0D7b910677F8A777661B5c910E8A9fd9E1e7E089;

  address public last_to_withdraw;
  uint public last_withdraw_block;
  uint public last_withdraw_amount;

  address public last_to_deposit;
  uint public last_deposit_block;
  uint public last_deposit_amount;

  uint unlock_time;

  function withdraw(uint amount) public {
    require(unlock_time < now, "Account is locked!");
    require(msg.sender == account_one || msg.sender == account_two, "You don't own this account!");

    if (last_to_withdraw != msg.sender) {
      last_to_withdraw = msg.sender;
    }

    last_withdraw_block = block.number;
    last_withdraw_amount = amount;

    //unlock_time = now + 24 hours;
    unlock_time = now + 10 seconds;

    msg.sender.transfer(amount);
  }

  function deposit() public payable {

    if (last_to_deposit != msg.sender) {
      last_to_deposit = msg.sender;
    }

    last_deposit_block = block.number;
    last_deposit_amount = msg.value;
  }

  function() external payable {}
}
