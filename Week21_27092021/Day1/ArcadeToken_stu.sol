pragma solidity ^0.5.0;

contract ArcadeToken {
    // set the contract owner to msg.sender here (make sure it is a payable address)
    address payable owner = msg.sender;
    
    // set the symbol of the token here (make sure to set the string as public)
    string public symbol = 'ARCD';
    
    // set the exchange_rate for how many tokens to distribute per wei
    uint public exchange_rate = 100;

    // set a mapping of address to uint called "balances"
    mapping(address => uint) balances;

    function balance() public view returns(uint) {
        // return the balance of msg.sender from the balances mapping
        return balances[msg.sender];
    }

    function transfer(address recipient, uint value) public {
        // subtract the value from msg.sender's balance
        balances[msg.sender] -= value;
        
        // add value to the recipient's balance
        balances[recipient] += value;
    }

    function purchase() public payable {
        // multiply the exchange rate by the msg.value
        uint amount = msg.value * exchange_rate; 
        
        // add the amount to the msg.sender's balance
        balances[msg.sender] += amount;
        
        // transfer the msg.value to the owner address
        owner.transfer(msg.value);
    }

    function mint(address recipient, uint value) public {
        // require that the msg.sender is the owner
        require(msg.sender == owner, "You are not the owner!"); 
        
        // add the value to the recipient's balance
        balances[recipient] += value;
    }
}