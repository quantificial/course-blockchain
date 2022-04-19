use SHA256 Hash

Immutable Ledger

Course Material: https://www.superdatascience.com/blockchain/

hash: https://tools.superdatascience.com/blockchain/hash/

signing: https://tools.superdatascience.com/blockchain/public-private-keys/signatures

blockchain resources: https://www.superdatascience.com/pages/blockchain


Consensus Protocol

Proof of Work and Proof of Stake


block chain demo

https://tools.superdatascience.com/blockchain/public-private-keys/blockchain


## create a blockchain

hash the block which contains data, timestamp, previous hash and then add the nonce to check whether the hash is smaller than a value, such as "0000000" to proof the work

it is required to "mine" the nonce.... 

refer to module 1 - create a blockchain

use flask and simple hash lib to create a block chain

## bitcoin

difficulty adjusted every two weeks, algorithm to determine, currently, it is 18 leading zero

timestamp is used in here as need to determine the time used for mining a block and such to adjust the difficulty

for around 10 minutes per block

## nonce range

nonce is 32bit and not enough to generate the correct hash ? actually, there is another field, timestamp which is used to calculate the hash, i.e. the unix timestamp 1519181244 

nonce 32 bit around 4 billion number

## pick trx

1 second to submit correct hash, then how mining pools work? they have trillion hash rate. 

miner pick the trx with higher fee first to include to the data block for mining and perform mining.

if still have remaining hash power, they pick another trx combination for mining.

### memory pool

select trx to perform mining and then confirm the block and remove confirmed trx from memory pool

broadcast to other nodes and they remove confirmed trx and confim the block

## transactions

Transactions and UTXOs

unspent transaction outputs

S => Me 0.6 BTC

spend 0.5 to buy bicycle

Input 0.6 => 0.5 BTC tp bicycle shop + 0.1 back to myself

your wallet value = total of the transactions that are in unspent status

### signatures private and public key

private key + public key

private key sign the message => message + signature

use public key to verify the message


groups of (transactions) + signature...

transactions = wallet address (my public key) to wallet address (target public key)

### segregated withness (SegWit)

increase bandwidth, need to increase block size 1mb , it is hard fork, such as bitcoin cash

or using soft fork, such as reduce the data in the transactions block, i.e. the signature and public key which may 
take up 60% of the data size of the transactions block, and send through another messaging channel.

### public key vs bitcoin address

public key => sha256 => bitcoin address

additional layer of protection...

### hierachically deterministic (HD) Wallets

use master private key to generate many private key to increase the privacy.

## create cryto currency

create decentralized nodes


## develop smart contract

need to use the remix ide https://remix.ethereum.org/

and compile the solidity code into byte code and deploy to the blockchain

example 1:

```
pragma solidity ^0.4.17;

contract Inbox {
    string public message;

    function Inbox(string initialMessage) public {
        message = initialMessage;
    }

    function setMessage(string newMessage) public {
        message = newMessage;
    }

    function getMessage() public view returns (string) {
        return message;
    }
}

```

example 2:

```
pragma solidity >=0.7.0 <0.9.0;


contract coin_ico {
    
    // max number of coins
    uint public max_coin = 1000000;
    
    // rate
    uint public usd_to_coin_rate = 1000;
    
    // total number being bought
    uint public total_bought = 0;
    
    // similar to hashmap?
    mapping(address => uint) equity_coins;
    
    mapping(address => uint) equity_usd;
    
    // checking if an investor can buy coins
    
    modifier can_buy_coins(uint usd_invested) {
        require(usd_invested * usd_to_coin_rate + total_bought <= max_coin);
        _;
    }
    
    function equity_in_coins(address investor) external view returns(uint) {
        return equity_coins[investor];
    }
    
    function equity_in_usd(address investor) external view returns(uint) {
        return equity_usd[investor];
    }
    
    function buy_coins(address investor, uint usd_invested) external 
    can_buy_coins(usd_invested) {
        uint coins_bought = usd_invested * usd_to_coin_rate;
        equity_coins[investor] += coins_bought;
        equity_usd[investor] = equity_coins[investor] / usd_to_coin_rate;
        total_bought += coins_bought;
    }
    
    function sell_coins(address investor, uint coins_sold) external {
        equity_coins[investor] -= coins_sold;
        equity_usd[investor] = equity_coins[investor] / usd_to_coin_rate;
        total_bought -= coins_sold;
    }
    
}
```


### use test network for the development

https://rinkeby-faucet.com/

install metamask and use rinkeby test network

use this to get eth for test network https://faucets.chain.link/rinkeby

### smart contract under Etherium - inbox

use solidity ^0.4.17;

need package mocha for unit testing

need solc for solidity compilation

web3 package for communication to the ethereum node or infura API server



