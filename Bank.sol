pragma solidity ^0.4.25;
contract Bank {
    address owner;
    mapping(address => uint) balances;
    
    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        if (balances[msg.sender] >= 10) {
            balances[msg.sender] -= 10;
            msg.sender.transfer(10);
        }
    }

    function getMyBalance() public view returns(uint) {
        return balances[msg.sender];
    }

    function kill() public {
        if (msg.sender == owner)
            selfdestruct(owner);
    }
}
