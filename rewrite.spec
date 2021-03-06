:[program
# 
## 
  :[
          #include "behaviortree_cpp_v3/bt_factory.h"

          // file that contains the custom nodes definitions
          #include "dummy_nodes.h"

          int main()
          {
                using namespace DummyNodes;

                BehaviorTreeFactory factory;
  :]
## 
  :[foreach @.kind
### 
        :[
                  factory.registerNodeType<@>("@")
        :]
  :]foreach
## 
  :[ 
          auto tree = factory.createTreeFromFile("./my_tree.xml");

          tree.tickRoot();
          return 0;
          }
  :]
## 
        :[
                        class @ : public SyncActionNode
                        {
                        public:
                          @(const std::string& name, const NodeConfiguration& config)
                                : SyncActionNode(name, config)
                          {
                          }


                          static PortsList providedPorts()
                          {
                                return { 
        :]
### 
  :[foreach @.inputs
#### 
    :[
            OutputPort (@)
    :]
  :]foreach
### 
  :[
                        };
                  }


                  // This Action writes a value into the port "text"
                  NodeStatus tick() override
                  {

  :]
### 
  :[foreach @.lines
#### 
    :[
            @
    :]
  :]foreach
### 
  :[
                 }
                };
  :]
:]program
