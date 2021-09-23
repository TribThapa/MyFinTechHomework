pragma solidity >= 0.5.0;

contract SimpleCustomerAccount {
  // insert code here
  address my_eth_address = 0xcC7EbAAaA14dFb82eEE14aEd6D9B7139f601941D;
  bool is_new_account = true;
  uint account_balance = 10000;
  string customer_name = "Bob";


  // getInfo function
  function getInfo() view public returns(address, bool, uint, string memory) {
      return (my_eth_address, is_new_account, account_balance, customer_name);
  }


  // setInfo function like an update on a variable
  function setInfo(address newOwner, bool isNewAccount, uint NewAccountBalance, string memory newCustomerName) public {
      my_eth_address = newOwner;
      is_new_account = isNewAccount;
      account_balance = NewAccountBalance;
      customer_name = newCustomerName;
  }
}