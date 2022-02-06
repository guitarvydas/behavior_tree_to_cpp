
#include "behaviortree_cpp_v3/bt_factory.h"

// file that contains the custom nodes definitions
#include "dummy_nodes.h"

int main()
{
  using namespace DummyNodes;

  BehaviorTreeFactory factory;


class ThinkWhatToSay : public SyncActionNode
{
public:
  ThinkWhatToSay(const std::string& name, const NodeConfiguration& config)
    : SyncActionNode(name, config)
  {
  }


static PortsList providePorts () {
    PortsList ports;
    ports.insert( BT::OutputPort<std::string>("text"));
    return ports;
}



  // This Action writes a value into the port "text"
  NodeStatus tick() override
  {
    // the output may change at each tick(). Here we keep it simple.
    setOutput("text", "The answer is 42" );
    return NodeStatus::SUCCESS;
  }

};


class SaySomething : public SyncActionNode
{
public:
  SaySomething(const std::string& name, const NodeConfiguration& config)
    : SyncActionNode(name, config)
  {
  }


static PortsList providePorts () {
    PortsList ports;
    ports.insert( BT::InputPort<std::string>("message"));
    return ports;
}



};


class SaySomethingSimple : public SyncActionNode
{
public:
  SaySomethingSimple(const std::string& name, const NodeConfiguration& config)
    : SyncActionNode(name, config)
  {
  }


static PortsList providePorts () {
    PortsList ports;
    
    return ports;
}



};


  auto tree = factory.createTreeFromFile("./my_tree.xml");

  tree.tickRoot();
  return 0;
}

