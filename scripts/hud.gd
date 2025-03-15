extends Control

@onready var score = $TextScore:
	set(value):
		score.text = "SCORE: " + str(value)
