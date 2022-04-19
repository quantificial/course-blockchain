pragma solidity ^0.4.17;

contract Lottery {
    // manager address
    // manager to trigger finding winner
    address public manager;

    // payers
    address [] public players;
    
    function Lottery() public {
        // access the msg Global Variable
        // msg.data, msg.gas, msg.sender, msg.value
        
        manager = msg.sender;
    }

    // array
    // fixed array int[3]
    // dynamic array int[]
    // mapping mapping(string => string)
    // struct struct C { string a; string }
    //

    // 10000000 gwei = 0.01 ether

    // it is modified by payable such that ether could be sent to this smart contract
    function enter() public payable {
        // requirement, need to specify ether, otherwise it is wei
        require(msg.value > 0.01 ether);
        players.push(msg.sender);
    }

    function random() private view returns(uint) {
        // keccak256() = sha3()
        return uint(keccak256(block.difficulty, now, players));

    }

    function testRandom() public view returns(uint) {
        return random();
    }

    function pickWinner() public restricted{

        // it is replaced by modifier
        //require(msg.sender == manager);

        // pick the winner by using the random function
        uint index = random() % players.length;
        
        // transfer all the ether in this smart contract to the winner
        players[index].transfer(this.balance);

        // clean the array
        // 0 is the initial size
        players = new address[](0);

    }

    // create modified function for checking
    modifier restricted() {
        require(msg.sender == manager);
        _; // <= it means the code in the function applied by the modifer will be placed here
    }

    function getPlayers() public view returns (address[]) {
        return players;
    }

}