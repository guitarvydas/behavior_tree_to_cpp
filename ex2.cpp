
#include "behaviortree_cpp_v3/bt_factory.h"

// file that contains the custom nodes definitions
#include "dummy_nodes.h"

int main()
{
  using namespace DummyNodes;

  BehaviorTreeFactory factory;

  auto tree = factory.createTreeFromFile("./my_tree.xml");

  tree.tickRoot();
  return 0;
}


class ThinkWhatToSay : public SyncActionNode
{
public:
  ThinkWhatToSay(const std::string& name, const NodeConfiguration& config)
    : SyncActionNode(name, config)
  {
  }


  static PortsList providedPorts () {
    PortsList ports;
    ports.insert( BT::OutputPort<std::string>("text"));
    return ports;
  }



  NodeStatus tick() override
  {
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


  static PortsList providedPorts () {
    PortsList ports;
    ports.insert( BT::InputPort<std::string>("message"));
    return ports;
  }



  NodeStatus tick() override
  {
    Optional<std::string> msg = getInput<std::string>("message");
        // Check if optional is valid. If not, throw its error
          if (!msg)
	          {
	        throw BT::RuntimeError("missing required input [message]: ", 
				                                      msg.error() );
            }
 
        // use the method value() to extract the valid message.
	        std::cout << "Robot says: " << msg.value() << std::endl;
        return NodeStatus::SUCCESS;
 
 
 
  }

};


class SaySomethingSimple : public SyncActionNode
{
public:
  SaySomethingSimple(const std::string& name, const NodeConfiguration& config)
    : SyncActionNode(name, config)
  {
  }


  static PortsList providedPorts () {
    PortsList ports;
    
    return ports;
  }



  NodeStatus tick() override
  {
    Optional<std::string> msg = self.getInput<std::string>("message");
      // Check if optional is valid. If not, throw its error
        if (!msg)
	      {
	      throw BT::RuntimeError("missing required input [message]: ", msg.error());
          }
 
      // use the method value() to extract the valid message.
	    std::cout << "Robot says: " << msg.value() << std::endl;
      return NodeStatus::SUCCESS;
 
 
 
 
  }

};


