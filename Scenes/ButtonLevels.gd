extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	if score <100:
		get_node("Level2_button").modulate = Color(2,1,1)
	if score <200:
		get_node("Level3_button").modulate = Color(2,1,1)


#func _process(delta):
#	if score <100:
#		get_node("UI/LevelChoose/ButtonLevels").set_visible(0.5)