class_name Enemy extends Area2D

signal killed
signal hit

@export var speed = 150
@export var hp = 1
@export var points = 100

@onready var txt_hp = $TextHp

func _ready() -> void:
	txt_hp.text = str(hp)

func _physics_process(delta: float) -> void:
	global_position.y += speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die()
		die()

func die():
	queue_free()
		
func take_damage(amount):
	hp -= amount
	hit.emit()
	if hp <= 0:
		killed.emit(points)
		die()
	else:
		txt_hp.text = str(hp)
	
