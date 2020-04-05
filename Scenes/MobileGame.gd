extends Node2D



onready var t1 = get_node("Levels/1_level/History/History_text")

var questions1 = ["Pan Jezus był skazany na śmierć przez:\n A)Piłata\n B)Barabasza", "Co miał prawo zrobić Piłat? \n A)Uwolnić \n B)Aresztować", "Kogo uwolnił Piłat? \n A)Jezusa \n B) Barabasza", "Czego domagał się tłum? \n A)Ukrzyżowania Jezusa \n B)Uwolnienia Jezusa", ". Co zrobił Piłat? \n A)był zdecydowany \n B)wahał siębył zdecydowany" ] # Pytania
var answers1 = [1,1,2,1,2] #Odpowiedzi
var AnswerTimes = 0
var CorrectAnswers: float
var LastScore
var ifskip: bool

var Scenes = ["Levels/1_level/Questions/Scene1","Levels/1_level/Questions/Scene2",
"Levels/1_level/Questions/Scene3","Levels/1_level/Questions/Scene4","Levels/1_level/Questions/Scene5"]
var TimerAnswers = ["Levels/1_level/Questions/Scene1/TimerSceneAnswer1", 
"Levels/1_level/Questions/Scene2/TimerSceneAnswer2",
"Levels/1_level/Questions/Scene3/TimerSceneAnswer3",
"Levels/1_level/Questions/Scene4/TimerSceneAnswer4",
"Levels/1_level/Questions/Scene5/TimerSceneAnswer5"]

var random_int
var answer
var QuestionedList = []

func _ready():
	pass

func _on_Start_Pressed():
	get_node("UI/LevelChoose").move(Vector2(0,0))
	change_question()

# 1 - answer A, 2 - answer B

func change_question():
	random_int = randi()%5
	QuestionedList.append(random_int)
	get_node("GameScene/QA_Table/Question").set_text(questions1[random_int])
	answer = answers1[random_int]


#ANSWER A
func _on_A_pressed():
	#Check answer
	if answer == 1:
		get_node("GameScene/QA_Table/AnswerTable/A").modulate = Color(1,2,1)
		get_node(TimerAnswers[AnswerTimes]).set_wait_time(1)
		get_node(TimerAnswers[AnswerTimes]).set_one_shot(true)
		get_node(TimerAnswers[AnswerTimes]).start()
		yield(get_node(TimerAnswers[AnswerTimes]), "timeout")
		get_node("GameScene/QA_Table/AnswerTable/A").modulate = Color(1,1,1)
		CorrectAnswers+=1
	else:
		get_node("GameScene/QA_Table/AnswerTable/A").modulate = Color(2,1,1)
		get_node(TimerAnswers[AnswerTimes]).set_wait_time(1)
		get_node(TimerAnswers[AnswerTimes]).set_one_shot(true)
		get_node(TimerAnswers[AnswerTimes]).start()
		yield(get_node(TimerAnswers[AnswerTimes]), "timeout")
		get_node("GameScene/QA_Table/AnswerTable/A").modulate = Color(1,1,1)
	#Regulation of number of repeat  amount
	if AnswerTimes<=4: #Next question
		
		AnswerTimes+=1
		get_node(Scenes[AnswerTimes-1]).position = Vector2(0,0)
		change_question()
		#get_node(Scenes[AnswerTimes-1]).position = Vector2(576,0)
		
	if AnswerTimes==5:# AnswerTimes==5: #Show FinishPanel
		get_node("UI/MainMenu").set_position(Vector2(576,0))
		$GameScene.set_position(Vector2(576,0))
		if CorrectAnswers>=4:
			get_node("/root/Game/UI/FinishMenu/Title/Label").set_text("Odblokowales nastepna stacje!")
		else:
			get_node("/root/Game/UI/FinishMenu/Title/Label").set_text("Try again!")
		get_node("UI/FinishMenu").set_position(Vector2(0,0))
		get_node("Levels").set_position(Vector2(576,0))
		LastScore = String((CorrectAnswers/5)*100) + "%"
		get_node("/root/Game/UI/FinishMenu/Score/ScoreTable").set_text(LastScore)

#ANSWER B
func _on_B_pressed():
	#Check answer
	if answer == 2: 
		get_node("GameScene/QA_Table/AnswerTable/B").modulate = Color(1,2,1)
		get_node(TimerAnswers[AnswerTimes]).set_wait_time(1)
		get_node(TimerAnswers[AnswerTimes]).set_one_shot(true)
		get_node(TimerAnswers[AnswerTimes]).start()
		yield(get_node(TimerAnswers[AnswerTimes]), "timeout")
		get_node("GameScene/QA_Table/AnswerTable/B").modulate = Color(1,1,1)
		CorrectAnswers+=1
		
	else:
		get_node("GameScene/QA_Table/AnswerTable/B").modulate = Color(2,1,1)
		get_node(TimerAnswers[AnswerTimes]).set_wait_time(1)
		get_node(TimerAnswers[AnswerTimes]).set_one_shot(true)
		get_node(TimerAnswers[AnswerTimes]).start()
		yield(get_node(TimerAnswers[AnswerTimes]), "timeout")
		get_node("GameScene/QA_Table/AnswerTable/B").modulate = Color(1,1,1)
		
	
	#Regulation of number of repeat  amount
	if AnswerTimes<=4: #Next question
		AnswerTimes+=1
		get_node(Scenes[AnswerTimes-1]).position = Vector2(0,0)
		change_question()
		#get_node(Scenes[AnswerTimes-1]).position = Vector2(576,0)
		
	if AnswerTimes==5:# AnswerTimes==5: #Show FinishPanel
		get_node("UI/MainMenu").set_position(Vector2(576,0))
		$GameScene.set_position(Vector2(576,0))
		if CorrectAnswers>=4:
			get_node("/root/Game/UI/FinishMenu/Title/Label").set_text("Odblokowales nastepna stacje!")
		else:
			get_node("/root/Game/UI/FinishMenu/Title/Label").set_text("Try again!")
		get_node("UI/FinishMenu").set_position(Vector2(0,0))
		get_node("Levels").set_position(Vector2(576,0))
		LastScore = String((CorrectAnswers/5)*100) + "%"
		get_node("/root/Game/UI/FinishMenu/Score/ScoreTable").set_text(LastScore)
	

func _on_StartLevel_Pressed(): #Przycisk rozpocznij przygode
	get_node("Levels/1_level/History").set_position(Vector2(576,0))
	$GameScene.set_position(Vector2(0,0))
	get_node("Levels/1_level/Questions/Scene1").position = Vector2(0,0)
	
	
	


func _on_Level1_button_pressed(): #Przycisk levelu 1
	get_node("Levels/1_level/History/").move(Vector2(0, 0))
	#Timer
	t1.set_bbcode(t1.dialog[t1.page])
	t1.set_visible_characters(0)


func _on_BackToMenu_Pressed(): #Rozpoczecie gry od MainMenu
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	


#skipping history animation
func _on_SkipWaiting_pressed():
	ifskip = true
	get_node("Levels/1_level/History/SkipWaiting").set_position(Vector2(576,0))
	get_node("/root/Game/Levels/1_level/History/Start2").set_position(Vector2(0,900))


func _on_JesusTalesName_ready():
	get_node("/root/Game/UI/MainMenu/Title").move(Vector2(0, 300))
