extends RichTextLabel


var dialog = ["Pilat wyszedl na zewnatrz i przemówil do obecnego tam ludu: Oto wyprowadzam Go do was na zewnatrz, abyscie poznali, ze a nie znajduję w nim zadnej winy. Po czym powiedział im, że w dzień Paschy ma prawo uwolnić jednego ze skazanych. Zapytał ich wiec, kogo ma uwolnić...czy Jezusa Nazarejczyka -króla zydowskiego, czy zbrodniarza imieniem Barabasz? Ci, zaządali uwolnienia Barabasza, domagając się tym samym ukrzyzowania Jezusa. Wtedy Pilat, wydal go na smierc."]
var page = 0
var v



func _ready():
	pass
	


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	v = get_visible_characters()
	if v == dialog[page].length():
		get_node("/root/Game/Levels/1_level/History/Start2").set_position(Vector2(0,900))
	if $"/root/Game/".ifskip == true:
		set_visible_characters(dialog[page].length())
	


