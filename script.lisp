(program
(textblock
(text "%0A")
(text "%20%20%20%20%20%20%20%20%20%20%2F%2F%20file%20that%20contains%20the%20custom%20nodes%20definitions%0A")
(text "%20%20%20%20%20%20%20%20%20%20%23include%20%22dummy_nodes.h%22%0A")
(text "%0A")
(text "%20%20%20%20%20%20%20%20%20%20int%20main()%0A")
(text "%20%20%20%20%20%20%20%20%20%20%7B%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20using%20namespace%20DummyNodes%3B%0A")
(text "%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20BehaviorTreeFactory%20factory%3B%0A")
)
(foreach
kind
(textblock
(text "factory.registerNodeType%3C")
tosref
(text "%3E(%22")
tosref
(text "%22)%0A")
)
)
(textblock
(text "auto%20tree%20%3D%20factory.createTreeFromFile(%22.%2Fmy_tree.xml%22)%3B%0A")
(text "%0A")
(text "%20%20%20%20%20%20%20%20%20%20tree.tickRoot()%3B%0A")
(text "%20%20%20%20%20%20%20%20%20%20return%200%3B%0A")
(text "%20%20%20%20%20%20%20%20%20%20%7D%0A")
)
(textblock
(text "class%20")
tosref
(text "%3A%20public%20SyncActionNode%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20public%3A%0A")
tosref
(text "(const%20std%3A%3Astring%26%20name%2C%20const%20NodeConfiguration%26%20config)%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3A%20SyncActionNode(name%2C%20config)%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%0A")
(text "%0A")
(text "%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20static%20PortsList%20providedPorts()%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20%7B%20%0A")
)
(foreach
inputs
(textblock
(text "OutputPort%20(")
tosref
(text ")%0A")
)
)
(textblock
(text "%7D%3B%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%0A")
(text "%0A")
(text "%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%2F%2F%20This%20Action%20writes%20a%20value%20into%20the%20port%20%22text%22%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20NodeStatus%20tick()%20override%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%0A")
(text "%0A")
)
(foreach
lines
(textblock
tosref
(text "%0A")
)
)
(textblock
(text "%7D%0A")
(text "%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%3B%0A")
)
)
