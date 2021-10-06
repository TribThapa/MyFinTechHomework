pragma solidity >=0.4.22 <0.6.0;

contract MartianAuction {
    
    address payable public beneficiary; // track the beneficiary of the contract
    address public highestBidder; // track the address of the current highest bidder
    uint public highestBid; // track the current highest bid amount of the highest bidder
    
    mapping(address => uint) pendingReturn; // track the pending returns of those that were outbid
    
    bool public ended; // track when the bidding period has closed and the auction has ended
    
    // two events that will be used to log data for the frontend dApp
    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    constructor(
        address payable _beneficiary
    ) public {
        beneficiary = _beneficiary;
    }

    function bid(address payable sender) public payable {
        require(msg.value > highestBid, 'Three already is a higher bid');
        
        require(!ended, "auctionEnd has already been called.");
        
        if (highestBid != 0) {
            pendingReturns[highestBidder] += highestBid;
        }
        highestBidder = sender;
        highestBid = msg.value;
        emit HighestBidIncreased(sender, msg.value);
    }

    function withdraw() public returns (bool) {
        uint amount = pendingReturns[msg.sender];
        
        if (amount > 0) {
            pendingReturns[msg.sender] = 0;
            
            if (!msg.sender.send(amount)) {
                pendingReturns[msg.sender] = amount;
                
                return false;
            }
        
        }
    }

    function pendingReturn(address sender) public view returns (uint) {
        return pendingReturns[sender];
    }

    function auctionEnd() public {
        require(!ended, "auctionEnd has already been called.");
        require(msg.sender == beneficiary, "You are not the auction beneficiary");
        
        ended = true;
        emit AuctionEnded(highestBidder, highestBid);
        
        beneficiary.transfer(highestBid);
    }
}
