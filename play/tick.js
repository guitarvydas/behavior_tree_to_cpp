
function box34 (item) {
    var result = undefined;
    var text = box35 ();
    result = box36 (item, text);
    return result;
}

function box33 (list) {
    var result = [];
    list.forEach (item => {
        result.push (box34 (item)) 
    });
    return result.join ('\n');
}

function box32 (item) {
    var result = undefined;
    result = box33 (item.inputs);
    return result;
}

function box31 (list) {
    var result = [];
    list.forEach (item => {
        result.push (box32 (item))
    });
    return result.join ('\n');
}

function box36 (at, text) {
    return text.replace (/@/g, at);
}

function box35 () {
    return `
  // This Action writes a value into the port "text"
  NodeStatus tick() override
  {
    // the output may change at each tick(). Here we keep it simple.
    setOutput("@", "The answer is 42" );
    return NodeStatus::SUCCESS;
  }
`
}


fs = require ('fs');
var json_components = fs.readFileSync ('component.json', 'utf-8');
var components = JSON.parse (json_components);
console.log (box31 (components));
