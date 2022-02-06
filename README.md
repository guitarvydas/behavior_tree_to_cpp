t2py
## stack
### multiple inputs/outputs
### {} as last component
### put newlines into lines, then retry play/run.bash


## regions:
### rewrite region
:[rewrite
  ...
:]

### foreach region
:[foreach
  ...
:]

### foreachfield region
:[foreachField @.name
  ...
:]

### text region
:[
  ...
:]




## @ in regions
@ is an object {kind, inputs, outputs, lines}
@.kind refers to the kind field of the object ; @.kind is a single item
@.inputs refers to the inputs field of the object ; @.inputs is a list
@.outputs refers to the outputs field of the object ; @.outputs is a list
@.lines refers to the lines of field of the object ; @.lines is a list

@ is scoped by the region, a new @ begins in the region and lasts until the end of the region


