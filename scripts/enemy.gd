extends Area2D

@export var speed = 250

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	global_position.x -= speed * delta

func die() -> void:
	queue_free()
