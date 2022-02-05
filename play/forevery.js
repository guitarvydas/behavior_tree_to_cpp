
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

fs = require ('fs');
var json_components = fs.readFileSync ('component.json', 'utf-8');
var components = JSON.parse (json_components);
console.log (box9 (components));
