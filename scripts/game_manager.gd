extends Node

var score = 0

@onready var score_label: Label = $ScoreLabel

func add_point():
	score += 1
	if score == 5:
		score_label.text = "Great! You have collected " + str(score) +" coins"
	elif score < 5:
		score_label.text = "You have collected " + str(score) +" coins, "+ str(5-score) + " left to go"
	
