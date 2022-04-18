// compile code will go here
const path = require('path');
const fs = require('fs');
const solc = require('solc');

const inboxPath = path.resolve(__dirname, 'contracts','Inbox.sol');
const source = fs.readFileSync(inboxPath, 'utf8');

const json = solc.compile(source,1);

console.log(json);
console.log('-------------------');
console.log(json.contracts[':Inbox']);

module.exports = json.contracts[':Inbox'];
