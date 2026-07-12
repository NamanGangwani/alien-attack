extends Area2D

signal died

@export var speed = 250

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	global_position.x -= speed * delta

func die() -> void:
	emit_signal("died")
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	body.take_damage()
	die()
