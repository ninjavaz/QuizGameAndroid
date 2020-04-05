extends Node2D




var questions = ["Pytanie nr 1: ", "Pytanie 2", "Pytanie 3"] # Pytania
var answers = [1,2,1] #Odpowiedzi
var random_int
var answer
var QuestionedList = []


func _ready():
	pass

func _on_Start_Pressed():
	get_node("UI/MenuButtons").move(Vector2(-576, 0))
	get_node("GameScene").move(Vector2(0,0))
	change_question()

# 1 - answer A, 2 - answer B

func change_question():
	random_int = randi()%3
	QuestionedList.append(random_int)
	get_node("GameScene/QA_Table/Question").set_text(questions[random_int])
	answer = answers[random_int]
	print(QuestionedList)


func _on_A_pressed():
	
	if answer == 1:
		print("Correct answer!")
	else:
		print("Wrong Answer!")
	change_question()
	
	
func _on_B_pressed():
	
	if answer == 2: 
		print("Correct answer!")
	else:
		print("Wrong Answer!")
	change_question()
	