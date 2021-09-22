pragma solidity ^0.5.0;

contract DayTradingAccount {

  // Initializes a payable address variable for the contract owner
  address contract_owner = '0x0D7b910677F8A777661B5c910E8A9fd9E1e7E089';

  // Initializes a uint timelock variable
  uint public unlock_time;


  // Constructor for setting the owner of the contract as the one who deploys the contract
  constructor(address payable contract_owner) public{
      contract_owner == msg.sender;
  }
  
  function deposit() public payable{
      if (last_to_deposit != msg.sender){
          last_to_deposit == msg.sender
      }
  }
  
  function() external payable{}
  
  function getBalance() public{
      
  }
  
  function withdraw(address contract_owner, uint amount) public{
      require(recipient == contract_owner, "You are not the owner of this account. Permission denied.")
      require(unlock_time < now, "You need to wait at least 24 hours from the last withdrawal before making another one.")
      require(getBalance(contract_owner) - )
      
      unlock_time = now + 24 hours;
      
  }


  }
 
  // Obtains the balance residing within the contract




  // Withdraws the balance to a specified recipient








  // Makes a deposit to the contract




  // Fallback function



}
