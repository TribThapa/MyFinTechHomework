pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";
import "./ICryptoRight.sol";

contract CryptoRight is ICryptoRight {

    using Counters for Counters.Counter;

    Counters.Counter copyright_ids;

    // Implement the Work struct
    struct Work {
        address owner;
        string uri;
    }

    // Implement the copyrights mapping
    mapping(uint => Work) public copyrights;

    // Implement the Copyright Event
    event Copyright(uint copyright_id, address owner, string reference_uri);

    // Implement the OpenSource Event
    event OpenSource(uint copyright_id, string reference_uri);

    // Implement the Transfer Event
    event Transfer(uint copyright_id, address new_owner);

    modifier onlyCopyrightOwner(uint copyright_id) {
        // Check if copyright owner is equal to msg.sender
        require(copyrights[copyright_id].owner == msg.sender, "You do not have permission to alter this copyright!");
        _;
    }

    function copyrightWork(string memory reference_uri) public {
        // Implement the copyrightWork function
        copyright_ids.increment();
        uint id = copyright_ids.current();
        
        copyrights[id] = Work(msg.sender, reference_uri);
        
        emit Copyright(id, msg.sender, reference_uri);
    }

    function openSourceWork(string memory reference_uri) public {
        // Implement the copyrightWork function
        copyright_ids.increment();
        uint id = copyright_ids.current();
        
        copyrights[id].uri = reference_uri;
        
        emit OpenSource(id, reference_uri);
    }

    function transferCopyrightOwnership(uint copyright_id, address new_owner) public onlyCopyrightOwner(copyright_id) {
        // Implement the copyrightWork function
        copyrights[copyright_id].owner = new_owner;
        
        emit Transfer (copyright_id, new_owner);
    }

    function renounceCopyrightOwnership(uint copyright_id) public onlyCopyrightOwner(copyright_id) {
        // Implement the copyrightWork function
        transferCopyrightOwnership(copyright_id, address(0));
        
        emit OpenSource(copyright_id, copyrights[copyright_id].uri);
    }

}
