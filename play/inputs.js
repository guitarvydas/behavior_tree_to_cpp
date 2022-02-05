
function inputs (listOfItems) {
    var resultList = [];
    listOfItems.forEach ( item => {
        var text = constant (`factory.registerNodeType<@>("@");`);
        result = edit (item, text);
        resultList.push (result);
    });
    return resultList;
}

function edit (at, text) {
    return text.replace (/@/g, at);
}

function constant (s) {
    return s;
}

//var argv = require('yargs/yargs')(process.argv.slice(2)).argv;
var argv = {json:"[1,2,3]"}
console.error (argv);
console.error (argv.json);
var listOfItems = JSON.parse (argv.json);
console.error (listOfItems);
console.error (inputs (listOfItems));
