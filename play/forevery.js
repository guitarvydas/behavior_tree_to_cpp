
function inputs (listOfItems) {
    var resultList = [];
    listOfItems.forEach ( item => {
        var text = constant (`factory.registerNodeType<@>("@");`);
        result = edit (item, text);
        resultList.push (result);
    });
    return resultList.join('\n');
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

function components (listOfComponents) {
    var result = [];
    listOfComponents.forEach (item => {
        var selection = select (item, "inputs");
        var result1 = inputs (selection);
        result.push (result1); 
    });
    return result.join('\n');
}



//var argv = require('yargs/yargs')(process.argv.slice(2)).argv;
var argv = {json:`[{"z":4,"inputs":[\"a\",\"b\",\"c\"],"y":5},{"z":6,"inputs":[\"d\",\"e\",\"f\"],"y":7}]`};
console.error (argv);
console.error (argv.json);
var components_instance = JSON.parse (argv.json);
var result = components (components_instance);
console.error (result);
