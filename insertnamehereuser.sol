pragma solidity ^0.8.15;

contract insertNameHereUser{
    string name; 
    address wallet;
    string password;
    uint balance; 
    string[] charities;
    
    constructor() public{
        name = "John Doe";
    }

    function getBalance() private returns(uint){
        balance = wallet.balance;
        return wallet.balance;
    }

    function addFunds(int amount) private {
    }


}