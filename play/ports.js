
function box24 (item) {
    var result = undefined;
    var text = box25 ();
    result = box26 (item, text);
    return result;
}

function box23 (list) {
    var result = [];
    list.forEach (item => {
        result.push (box24 (item)) 
    });
    return result.join ('\n');
}

function box22 (item) {
    var result = undefined;
    result = box23 (item.inputs);
    return result;
}

function box21 (list) {
    var result = [];
    list.forEach (item => {
        result.push (box22 (item))
    });
    return result.join ('\n');
}

function box26 (at, text) {
    return text.replace (/@/g, at);
}

function box25 () {
    return `
  static PortsList providedPorts()
  {
    return { OutputPort("@") };
  }
`
}


fs = require ('fs');
var json_components = fs.readFileSync ('component.json', 'utf-8');
var components = JSON.parse (json_components);
console.log (box21 (components));
