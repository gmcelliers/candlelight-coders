pragma solidity ^0.8.0;
// "SPDX-License-Identifier: UNLICENSED"

contract DeCharity{
    string public name;
    uint public charityCount = 0;
    // uint public productCount = 0;
    // mapping(uint => Product) public products;
    mapping(uint => Charity) public charities;

    // struct Product {
    //     uint id;
    //     string name;
    //     uint price;
    //     string description;
    //     address owner; 
    // }
    
    struct Charity {
        uint id;
        string name;
        address payable owner;
        bool verified;
    }

    constructor() {
        name = "DeCharity";
    }

    function add_charity(string memory _name, address payable _owner, bool _verified) public {
        require(bytes(_name).length > 0);
        
        charityCount++;
        charities[charityCount] = Charity(charityCount, _name, _owner, _verified);
    }

    function get_charities() 
    public view
    returns (Charity[] memory _charities){
        Charity[] memory temp = new Charity[](charityCount);
        for (uint i = 0; i < charityCount; i++) {
            temp[i] = charities[i];
        }
        return temp;
    }

    function donate(uint charity_id)
    public payable
    returns (bool success) {

        require(msg.value>0,"Amount must be more than 0");
        require(charity_id>0 && charity_id<= charityCount,"Please select a charity");

        Charity memory _charity = charities[charity_id];
        require(msg.sender != _charity.owner);

        address payable _charity_address = _charity.owner;
        
        payable(_charity_address).transfer(msg.value);

        return true;
    }   

    // function createProduct(string memory _name, uint price) public {
    //     // Require a valid name
    //     require(bytes(_name).length > 0);
    //     // Require a valid price
    //     require(_price > 0);
    //     // Increment product count
    //     productCount ++;
    //     // Create the product
    //     products[productCount] = Product(productCount, _name, _price, msg.sender, false);
    //     // Trigger an event
    //     emit ProductCreated(productCount, _name, _price, msg.sender);
    // }

}