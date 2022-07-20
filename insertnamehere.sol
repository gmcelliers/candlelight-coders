pragma solidity ^0.8.15;

contract InsertNameHereOrg{
    string name;
    address wallet;
    string account;
    string password; 
    string[] donatorList;
    int goal;
    int public donateCount = 0;
    

    constructor() public{
        name = "Charity";
    }
    
    function get() public view returns(string) {
        return donatorList;
    }
    
    function set(int value) private {
        goal = value;
    }

    function increment() public{
        donateCount+=1;
    }

    function getBalance() private view returns(uint) {
        return wallet.balance;
    }
}