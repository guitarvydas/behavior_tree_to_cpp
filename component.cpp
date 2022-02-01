class @name@ : public SyncActionNode
{
public:
  @name@(const std::string& name, const NodeConfiguration& config)
    : SyncActionNode(name, config)
  {
  }


  static PortsList providedPorts()
  {
    return { @dolist{ @outputports@ OutputPort(@item@)}@ };
  }


  // This Action writes a value into the port "text"
  NodeStatus tick() override
  {
    @dolist { @lines@
      @item@
    }@
  }
};

// SyncActionNode (synchronous action) with an input port.
class SaySomething : public SyncActionNode
{
public:
  // If your Node has ports, you must use this constructor signature 
  SaySomething(const std::string& name, const NodeConfiguration& config)
    : SyncActionNode(name, config)
  { }

  // It is mandatory to define this static method.
  static PortsList providedPorts()
  {
    // This action has a single input port called "message"
    // Any port must have a name. The type is optional.
    return { InputPort<std::string>("message") };
  }

  // As usual, you must override the virtual function tick()
  NodeStatus tick() override
  {
    @dolist[[@item.lines@[[
      @item@
    ]]
    ]]
  }
};
