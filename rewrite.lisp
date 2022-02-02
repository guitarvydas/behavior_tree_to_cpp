 (foreach component
	  (block "	 
	  #include %22behaviortree_cpp_v3/bt_factory.h%22

	  // file that contains the custom nodes definitions
	  #include "dummy_nodes.h"

	  int main()
	  {
		using namespace DummyNodes;

		BehaviorTreeFactory factory;
  ")
	  (foreach kind
		   (block "
		  factory.registerNodeType<@.kind>("@.kind")
	")
		   )
	  (block "
	  auto tree = factory.createTreeFromFile("./my_tree.xml");

	  tree.tickRoot();
	  return 0;
	  }
  ")
	  (block "
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
")
	  (foreach inputs
		   (block "
            OutputPort (@)
    ")
		   )
	  (block "
			};
		  }


		  // This Action writes a value into the port "text"
		  NodeStatus tick() override
		  {

  ")
	  (foreach lines
		   (block "
            @
   ")
		   )
	  (block "
		 }
		};
  ")
	  )
