
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


////

function select (item, field) {
    return item [field];
}

////////



//var argv = require('yargs/yargs')(process.argv.slice(2)).argv;
var argv = {json:`{"z":4,"inputs":[\"a\",\"b\",\"c\"],"y":5}`};
console.error (argv);
console.error (argv.json);
var item = JSON.parse (argv.json);
console.error (item);
var selection = select (item, "inputs");
console.error (selection);
var result = inputs (selection);
console.error (result);
