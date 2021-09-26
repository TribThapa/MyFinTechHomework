pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract ArcadeToken {
    using SafeMath for uint;

    address payable owner = msg.sender;
    string public symbol = "ARCD";
    uint public exchange_rate = 100;
    
    // insert public fee_rate here in "basis points" -- used to calculate the fee percentage later
    uint public fee_rate = 1; // 0.01%
    
    // insert public reward_rate set to the amount of tokens rewarded per wei spent
    uint public reward_rate = 3;

    mapping(address => uint) balances;

    function balance() public view returns(uint) {
        return balances[msg.sender];
    }

    function transfer(address recipient, uint value) public {
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[recipient] = balances[recipient].add(value);
    }

    function purchase() public payable {
        uint amount = msg.value.mul(exchange_rate);
        balances[msg.sender] = balances[msg.sender].add(amount);
        owner.transfer(msg.value);
    }

    function mint(address recipient, uint value) public {
        require(msg.sender == owner, "You do not have permission to mint tokens!");
        balances[recipient] = balances[recipient].add(value);
    }

    // Remember to use SafeMath for all math operations!
    function spend(address payable recipient) public payable {
        // calculate 0.25% from basis points using msg.value (percent = basis_points * your_number / 10000)
        uint fee = msg.value.mul(fee_rate).div(10000);
        
        // reward 3 points for every wei spent (multiply msg.value)
        uint reward = msg.value.mul(reward_rate);
        
        // add reward to sender point balance
        balances[msg.sender] = balances[msg.sender].add(reward);

        // transfer msg.value minus fee to the recipient
        recipient.transfer(msg.value.sub(fee));
        
        // transfer fee to owner here
        owner.transfer(fee);
    }
}