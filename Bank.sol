pragma solidity ^0.4.25;
contract Bank {
    address owner;
    mapping(address => uint) balances;
    
    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external {
        if (balances[msg.sender] >= 10) {
            balances[msg.sender] -= 10;
            msg.sender.transfer(10);
        }
    }

    function getMyBalance() external view returns(uint) {
        return balances[msg.sender];
    }

    function kill() external {
        if (msg.sender == owner)
            selfdestruct(owner);
    }
}
