extends Node2D
#signal _spawn_block(block_ins,isLeft)

var block = preload("res://block.tscn")
var rng = RandomNumberGenerator.new()
var cell_size = null
@onready var spawn_timer = $spawn_timer
@onready var blocks = $Blocks

func _ready():
	cell_size = get_parent().cell_size
	pass


func _process(delta):
	pass
	
func rand_spawn(): 
	# decide direction
	var ran = rng.randi() % 4
	var isRight
	if ran >= 1: 
		isRight = true
	else: 
		isRight = false
		
	# decide y offset
	ran = rng.randi() % 2 
	var y_offset = 1
	if ran == 0: 
		y_offset = 1 
	else: 
		y_offset =-1
		
	spawn_block(isRight,y_offset)
	
func spawn_block(isRight,y_offset): 
	var block_ins = block.instantiate()
	
	# spawn left or right
	if isRight: 
		block_ins.position=$right.position
		blocks.add_child(block_ins)
		remove_first_block()
		
	else: 
		block_ins.position=$left.position
		blocks.add_child(block_ins)
		blocks.move_child(get_last_block(),0)
		remove_last_block()
		
	# update position marker 		
	move_pos(isRight,y_offset)	
func get_last_block(): 
	return blocks.get_child(blocks.get_child_count()-1)

func move_pos(isRight,y_offset): 
	if isRight: 
		$right.position.x += cell_size	
		$right.position.y += cell_size*y_offset	
		
		$left.position.x += cell_size
		$left.position.y = blocks.get_child(0).position.y 
		
	else: 
		$right.position.x -=cell_size
		$right.position.y =get_last_block().position.y
		
		$left.position.x -=cell_size
		$left.position.y += cell_size*y_offset	


func remove_first_block():
	blocks.remove_child(blocks.get_child(0))
func remove_last_block():
	blocks.remove_child(blocks.get_child(blocks.get_child_count()-1))
	

func _on_spawn_timer_timeout():
	rand_spawn()
