use SHA256 Hash

Immutable Ledger


hash: https://tools.superdatascience.com/blockchain/hash/

signing: https://tools.superdatascience.com/blockchain/public-private-keys/signatures

blockchain resources: https://www.superdatascience.com/pages/blockchain


Consensus Protocol

Proof of Work and Proof of Stake


block chain demo

https://tools.superdatascience.com/blockchain/public-private-keys/blockchain


## create a blockchain

hash the block which contain data, timestamp, previous hash and then add the nonce to check whether the hash is smaller than a value, such as "0000000" to proof the work

it is required to "mine" the nonce.... 

refer to module 1 - create a blockchain

use flask and simple hash lib to create a block chain

## bitcoin

difficulty adjusted every two weeks, algorithm to determine, currently, it is 18 leading zero

## nonce range

nonce is 32bit and not enough to generate the correct hash ? actually, there is another field, timestamp which is used to calculate the hash, i.e. the unix timestamp 1519181244 

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

## create cryto curreny







