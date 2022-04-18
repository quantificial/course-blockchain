// contract test code will go here

const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');

// get the compile contract bytecode and ABI (interface)
const {interface, bytecode} = require('../compile');

// create instance for web3 and with the ganache provider
const web3 = new Web3(ganache.provider());

let accounts;
let inbox;

// beforeEach(()=> {
//     console.log('before test...');
    
//     web3.eth.getAccounts()
//         .then(fetchedAccounts => {
//             console.log(fetchedAccounts);
//         })
// })

beforeEach( async() => {
    accounts = await web3.eth.getAccounts();
    console.log(accounts[0]);

    inbox = await new web3.eth.Contract(JSON.parse(interface))
        .deploy(
            {
                data: bytecode, 
                arguments: ['hi there!']
            })
        .send(
            {
                from: accounts[0], 
                gas:'1000000'
            });

});

// simple test
// to start the test: npm run test
// describe('Test Group', () => {
//     it('Single Test', () => {
//         assert.equal(true, true);
//     });

//     it('Second Test Failed', ()=> {
//         assert.equal(true,false);
//     })
// })

describe('Inbox', () => {
    it('deploys a contract', ()=> {
        //console.log(inbox);
        console.log('deploy a contract:');
        console.log(inbox.options.address);
        assert.ok(inbox.options.address);
    })

    it('default message', async() => {
        console.log('default message:');
        const message = await inbox.methods.message().call();
        console.log(message);
        assert.ok(message);
    })

    it('update message', async ()=> {
        await inbox.methods.setMessage('bye').send({from: accounts[1]});
        const message = await inbox.methods.message().call();
        console.log(message);
        assert.ok(message);
    })
})