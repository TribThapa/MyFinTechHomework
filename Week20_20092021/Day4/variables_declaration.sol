// Variables Declaration and Basic Operations

pragma solidity ^0.5.0;

// This is a comment - any code commented is not executed -

/*
This is a multi-line comment.
You can comment out many lines at once.
For the most part, you will see single-line comments, but it is good to see this.

As in single-line comments, any code contained within multi-line comments is not executed.
*/

contract TravelExpenses {
  // 1. Create a public payable address variable named `corporate_account` and assign a valid Ethereum address to it.
  
  address corporate_account = '0xcC7EbAAaA14dFb82eEE14aEd6D9B7139f601941D';

  // 2. Create payable address variable named `personal_account` and assign a valid Ethereum address to it
  
  address personal_account = '0x0D7b910677F8A777661B5c910E8A9fd9E1e7E089';

  // 3. Define and assign a string variable named "employee_name` that has your name.
  
  string employee_name = 'Thapa';

  // 4. Create a constant `256 bit` unsigned integer `daily_expenses_eth` with an initial value of `1`.
  
  uint256 daily_expenses_eth = 16;

  // 5. Create a `256 bit` unsigned integer named `current_expenses_wei` with an initial value of `0`.
  
  uint256 current_expenses_wei = 0;

  // 6. Create an unsigned integer `current_taxes_wei` with an initial value of `0`.
  
  uint current_taxes_wei = 0;

  // 7. Create a `16 bit` unsigned integer `expenses_count` and assign a value of `0`.
  
  uint expenses_count = 0;

  // 8. Create an unsigned `32 bit` integer `eth_usd_rate` and assign the current value in USD of `1 ETH` to it.
  
  uint32 eth_usd_rate = 1 ETH;

  // 9. Create a `256` unsigned integer constant `eth_wei_rate` and assign the number of Wei in one Ether.
  
  uint256 eth_wei_rate = 10**18;

  // 10. Create a new public unsigned `256 bit` integer variable named `daily_expenses_wei` and assign the value of `daily_expenses_eth` plus eth_wei_rate.
  
  uint256 public daily_expenses_wei = daily_expenses_eth + eth_wei_rate;
  

  function RecordExpense(uint32 new_net_expense_usd, uint tax_rate) public {
    // 11. Create an unsigned `256 bit` integer `expense_usd_no_tax` and assign the value of the `new_expensed_usd` minus taxes.
    
    uint256 expense_usd_no_tax = new_expensed_usd;

    // 12. Create an unsigned `256 bit` integer `taxes_usd` and assign the taxes in USD from `new_net_expense_usd`.
    
    uint256 taxes_usd = new_net_expense_usd;

    // 13. Update the `current_expenses_wei` by adding the `expense_usd_no_tax` converted to Wei.
    
    current_expenses_wei = expense_usd_no_tax * eth_wei_rate;

    // 14. Update the `current_taxes_wei` by adding the `taxes_usd` converted to Wei.
    
    current_taxes_wei = taxes_usd * eth_wei_rate;

    // 15. Increase `expenses_count` in one unit.
    
    expenses_count = expenses_count + 1;
  }
}
