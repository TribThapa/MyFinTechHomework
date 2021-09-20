pragma solidity >= 0.5.0;

contract SimpleCustomerAccount {
  // insert code here
  address my_eth_address = 0xc3879B456DAA348a16B6524CBC558d2CC984722c;
  bool is_new_account = true;
  uint account_balance = 123123123123;
  string customer_name = 'Thapa';
  
  function getInfo() public returns(address, bool, uint, string){
      return (my_eth_address, is_new_account, account_balance, customer_name);
  }
    
  function setInfo(address, newOwner, bool isNewAccount, unit NewAccountBalance, string memory newCustomerName) public{
      my_eth_address = address;
      is_new_account = isNewAccount;
      account_balance = NewAccountBalance;
      customer_name = newCustomerName;
  }
}
