extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	pass # Replace with function body.



func move(target):
    var move_tween = get_node("Tween0")
    move_tween.interpolate_property(self, "position", position, target, 2, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
    move_tween.start()
