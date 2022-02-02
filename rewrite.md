# 
:[rewrite
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
  :[foreach
### 
	:[
		  factory.registerNodeType<@.kind>("@.kind")
	:]
  :]
## 
  :[ 
	  auto tree = factory.createTreeFromFile("./my_tree.xml");

	  tree.tickRoot();
	  return 0;
	  }
  :]
## 
  :[foreach
### 
	:[
			class @.kind : public SyncActionNode
			{
			public:
			  @.kind(const std::string& name, const NodeConfiguration& config)
				: SyncActionNode(name, config)
			  {
			  }


			  static PortsList providedPorts()
			  {
				return { 
	:]
  :]
### 
  :[foreachfield @.inputs
#### 
    :[
            OutputPort (@)
    :]
  :]
### 
  :[
			};
		  }


		  // This Action writes a value into the port "text"
		  NodeStatus tick() override
		  {

  :]
### 
  :[foreachfield @.lines
#### 
    :[
            @
    :]
  :]
### 
  :[
		 }
		};
  :]
:]
