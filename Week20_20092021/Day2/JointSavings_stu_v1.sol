pragma solidity ^0.5.0;

contract JointSavings {
    address account_one = '0xcC7EbAAaA14dFb82eEE14aEd6D9B7139f601941D';
    address account_two = '0xcC7EbAAaA14dFb82eEE14aEd6D9B7139f601941D';
    _public uint_ balanceContract
    
    function withdraw(unit amount, address payable recipient) public {
        return recipient.transfer(amount);
        balanceContract = address(this).balance;
    }
    
    function deposit() public payable{
        balanceContract = address(this).balance;
    }
}
