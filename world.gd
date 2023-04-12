extends Node2D

var cell_size = 64

#@onready var levelgen = $LevelGenerator  
#@onready var blocks = $Blocks  

func _ready():
#	levelgen.connect("_spawn_block",_on_spawn_block)
	pass
	
	
#func remove_first_block():
#	blocks.remove_child(blocks.get_child(0))
#func remove_last_block():
#	blocks.remove_child(blocks.get_child(blocks.get_child_count()-1))
#
#func _on_spawn_block(block_ins,isLeft): 
#	blocks.add_child(block_ins)
#	remove_first_block()
## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



