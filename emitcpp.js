function fjoin (a, b) {
    return a + b;
}

function xcall (func, x, y, z) {
    return func (x, y, z);
}

function fcall (func, x, y, z) {
    return func (x, y, z);
}

function constant (x, y) {
    return x;
}

function _edit (text, re, replacement) {
    return text.replace (re, replacement);
}

function edit (text, replacement) {
    return _edit (text, /@/g, replacement);
}

function edit1 (text, replacement) {
    return _edit (text, /@1/g, replacement);
}

function edit2 (text, replacement) {
    return _edit (text, /@2/g, replacement);
}

function edit3 (text, replacement) {
    return _edit (text, /@3/g, replacement);
}

function select (obj, field) {
    return obj [field];
}



//// main 

function box7 () {
    return constant (`
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
`,null);
}

//// end main

/// class
function box915 () {
    return constant (`
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
`,null);
}

function box916 (attext, text) {
    return edit1 (text, attext);
}

function box914 (attext) {
    return fcall (box916, attext, fcall (box915));
}

function box810 (component) {
    return fcall (box914, select (component, "name"));
}

////// ports

function box24 (item) {
    return fcall (box25, item, fcall (box26));
}

function box23 (list) {
    var result = [];
    list.forEach (item => {
        result.push (fcall (box24, item)); 
    });
    return result.join ('\n');
}

function box22 (item) {
    return fcall (box23, item.inputs);
}

function box25 (at, text) {
    return edit (text, at);
}

function box26 () {
    return constant (`ports.insert( BT::InputPort<std::string>("@"));`);
}




function box74 (item) {
    return fcall (box75, item, fcall (box76));
}

function box73 (list) {
    var result = [];
    list.forEach (item => {
        result.push (fcall (box74, item)) 
    });
    return result.join ('\n');
}

function box72 (item) {
    return fcall (box73, select (item, "outputs"));
}

function box75 (at, text) {
    return edit (text, at);
}

function box76 () {
    return constant (`ports.insert( BT::OutputPort<std::string>("@"));`);
}

function box50 (A, B) {
    return fjoin (A, B);
}

function box51 (attext, text) {
    return edit (text, attext);
}

function box52 () {
    return constant (`
static PortsList providedPorts () {
    PortsList ports;
    @
    return ports;
}
`);
}

function box21 (component) {
    return fcall (box51, fcall (box50, fcall (box22, component), fcall (box72, component)), fcall (box52)); 
}

////////// end ports


////////// tick
function remove_nbsp (s) {
    return s.replace (/ /g," ");
}

    //var r = decodeURIComponent (remove_nbsp);

function box932 (item) {
    return xcall (decodeURIComponent, xcall (remove_nbsp, select (item, "lines")));
}

////////// end tick

///////// for each component
function box150 (text, at2text) {
    return edit2 (text, at2text);
}

function box160 (text, at3text) {
    return edit3 (text, at3text);
}

function box180 (list) {
    var result = [];
    list.forEach (component => {
	if (undefined === component || undefined === component.outputs) {
	    // ignore null components for sake of snapshot1
	    // console.error ("looks like {} is in component.json");
	    // throw "null component";
	} else {
	    var clssports = fcall (box150, 
				   fcall (box810, component), 
				   fcall (box21, component));
	    var clssportstick = fcall (box160, 
				       clssports, 
				       fcall (box932, component));
	    result.push (clssportstick);
	}
    });
    return result.join ('\n');
}
///////// end for each component


//////// top
function box170 (text, attext) {
    return text.replace (/@/g, attext);
}


fs = require ('fs');
var json_components = fs.readFileSync ('component.json', 'utf-8');
var components = JSON.parse (json_components);

var string_main = box7 (components);
var string_instances = box180 (components);
var string_joined = box170 (string_main, string_instances);

console.log (string_joined);

