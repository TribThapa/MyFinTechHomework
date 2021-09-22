pragma solidity ^0.5.0;

// lvl 3: equity plan
contract DeferredEquityPlan {
    address human_resources;

    address payable employee; 
    bool active = true; 
    
    uint total_shares = 1000;
    uint annual_distribution = 250;

    uint start_time = now; 

    uint unlock_time = now + 365;

    uint public distributed_shares; 

    constructor(address payable _employee) public {
        human_resources = msg.sender;
        employee = _employee;
    }

    function distribute() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract not active.");

        require(unlock_time <= now, "Shares have not been invested");
        require(distributed_shares < total_shares, "Shares have been distributed");

        unlock_time += 365 days;

        distributed_shares = (now - start_time) / 365 days * annual_distribution;

        // double check in case the employee does not cash out until after 5+ years
        if (distributed_shares > 1000) {
            distributed_shares = 1000;
        }
    }

    // human_resources and the employee can deactivate this contract at-will
    function deactivate() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to deactivate this contract.");
        active = false;
    }

    // Since we do not need to handle Ether in this contract, revert any Ether sent to the contract directly
    function() external payable {
        revert("Do not send Ether to this contract!");
    }
}
