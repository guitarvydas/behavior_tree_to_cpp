
function box4 (item) {
    var result = undefined;
    var text = box5 (`factory.registerNodeType<@>("@");`);
    result = box6 (item, text);
    return result;
}

function box3 (list) {
    var result = [];
    list.forEach (item => result.push (box4 (item)) );
    return result.join ('\n');
}

function box2 (item) {
    var result = undefined;
    result = box3 (item.inputs);
    return result;
}

function box1 (list) {
    var result = [];
    list.forEach (item => result.push (box2 (item)));
    return result.join ('\n');
}

function box6 (at, text) {
    return text.replace (/@/g, at);
}

function box5 (s) {
    return `factory.registerNodeType<@>("@");`;
}


//var argv = require('yargs/yargs')(process.argv.slice(2)).argv;
var argv = {json:`[{"z":4,"inputs":[\"a\",\"b\",\"c\"],"y":5},{"z":6,"inputs":[\"d\",\"e\",\"f\"],"y":7}]`};
console.error (argv);
console.error (argv.json);
var components_instance = JSON.parse (argv.json);
var result = box1 (components_instance);
console.error (result);
