extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Start_Pressed():
	get_node("Game/UI/MenuButtons").move(Vector2(-576, 0))
	get_node("Game/GameScene/QuestionTable").move(Vector2(0,0))
	#get_node("GameScene/QuestionTable/Question").set_text("Siema")
	