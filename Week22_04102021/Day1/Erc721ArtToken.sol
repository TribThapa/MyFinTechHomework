pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";


contract CryptoFax is ERC721Full {

    constructor() ERC721Full("CryptoFax", "CARS") public { }

    using Counters for Counters.Counter;
    Counters.Counter token_ids;

    struct Car {
      string vin; 
      uint accidents;
    }
    
    mapping(uint => Car) public cars;
  
    event Accident(uint token_id, string report_uri);

    function registerVehicle(address owner, string memory vin, string memory token_uri) public returns(uint) {
      token_ids.increment();
      uint token_id = token_ids.current();
      
      _mint(owner, token_id);
      _setTokenURI(token_id, token_uri);
      
      cars[token_id] = Car(vin, 0);
      return token_id;
    }

    function reportAccident(uint token_id, string memory report_uri) public returns(uint) {
       cars[token_id].accidents += 1;
       
       emit Accident(token_id, report_uri);
       
       return cars[token_id].accidents;
    }
}