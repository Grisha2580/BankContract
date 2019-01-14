pragma solidity ^0.4.25;
contract Bank {
    address owner;
    mapping(address => uint) balances;
    
    function Bank() {
        owner = msg.sender;
    }

    function deposit() public external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public external {
        if (balances[msg.sender] >= 10) {
            balances[msg.sender] -= 10;
            msg.sender.transfer(10);
        }
    }

    function getMyBalance() public external view returns(uint) {
        return balances[msg.sender];
    }

    function kill() public external {
        if (msg.sender == owner)
            selfdestruct(owner);
    }
}
