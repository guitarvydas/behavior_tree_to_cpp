
function box14 (item) {
    var result = undefined;
    var text = box15 ();
    result = box16 (item, text);
    return result;
}

function box13 (list) {
    var result = [];
    list.forEach (item => {
        result.push (box14 (item)) 
    });
    return result.join ('\n');
}

function box12 (item) {
    var result = undefined;
    result = box13 (item.inputs);
    return result;
}

function box11 (list) {
    var result = [];
    list.forEach (item => {
        result.push (box12 (item))
    });
    return result.join ('\n');
}

function box16 (at, text) {
    return text.replace (/@1/g, at);
}

function box15 () {
    return `
class @1 : public SyncActionNode
{
public:
  @1(const std::string& name, const NodeConfiguration& config)
    : SyncActionNode(name, config)
  {
  }

@2

@3
};
`
}


fs = require ('fs');
var json_components = fs.readFileSync ('component.json', 'utf-8');
var components = JSON.parse (json_components);
console.log (box11 (components));
