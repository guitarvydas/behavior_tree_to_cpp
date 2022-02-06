
function box24 (item) {
    var result = undefined;
    var text = box26 ();
    result = box25 (item, text);
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

function box25 (at, text) {
    return text.replace (/@/g, at);
}

function box26 () {
    return `ports.insert( BT::InputPort<std::string>("@"));`;
}


function box21 (component) {
    var input_ports = box22 (component);
    var output_ports = box72 (component);
    var ports = box50 (input_ports, output_ports);
    var boilerplate = box52 ();
    var portdef = box51 (ports, boilerplate); 
    return portdef;
}

function box50 (a, b) {
    return a + b;
}

function box51 (at, text) {
    return text.replace (/@/g, at);
}

function box52 () {
    return `
static PortsList providePorts () {
    PortsList ports;
    @
    return ports;
}
`
}



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



function box4 (item) {
    var result = undefined;
    var text = box5 ();
    result = box6 (item, text);
    return result;
}

function box3 (list) {
    var result = [];
    list.forEach (item => {
        result.push (box4 (item)) 
    });
    return result.join ('\n');
}

function box2 (item) {
    var result = undefined;
    result = box3 (item.inputs);
    return result;
}

function box1 (list) {
    var result = [];
    list.forEach (item => {
        result.push (box2 (item))
    });
    return result.join ('\n');
}

function box6 (at, text) {
    return text.replace (/@/g, at);
}

function box5 () {
    return `factory.registerNodeType<@>("@");`;
}

function box7 () {
    return `
#include "behaviortree_cpp_v3/bt_factory.h"

// file that contains the custom nodes definitions
#include "dummy_nodes.h"

int main()
{
  using namespace DummyNodes;

  BehaviorTreeFactory factory;

@

  auto tree = factory.createTreeFromFile("./my_tree.xml");

  tree.tickRoot();
  return 0;
}
`;
}

function box8 (at, text) {
    return text.replace (/@/g, at);
}

function box9 (list) {
    var a = box1 (list);
    var b = box7 ();
    var result = box8 (a, b);
    return result;
}

function box150 (at, text) {
    return text.replace (/@2/g, at);
}
function box160 (at, text) {
    return text.replace (/@3/g, at);
}
function box170 (A, B) {
    return A + B;
}

function box180 (list) {
    var result = [];
    list.forEach (item => {
	    var cls = box14 (item);
	    var ports = box21 (item);
	    var tick = box32 (item)
	    var temp = box150 (ports, cls);
	    var temp2 = box160 (tick, temp);
	    result.push (temp2);
    });
    return result.join ('\n');
}



function box74 (item) {
    var result = undefined;
    var text = box76 ();
    result = box75 (item, text);
    return result;
}

function box73 (list) {
    var result = [];
    list.forEach (item => {
        result.push (box74 (item)) 
    });
    return result.join ('\n');
}

function box72 (item) {
    var result = undefined;
    result = box73 (item.outputs);
    return result;
}

function box75 (at, text) {
    return text.replace (/@/g, at);
}

function box76 () {
    return `ports.insert( BT::OutputPort<std::string>("@"));`;
}

fs = require ('fs');
var json_components = fs.readFileSync ('component.json', 'utf-8');
var components = JSON.parse (json_components);
var string_instances = box180 (components);
var string_main = box9 (components);
var string_final = box170 (string_main, string_instances);
console.log (string_final);
