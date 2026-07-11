extends Area2D

@export var speed = 250

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	global_position.x -= speed * delta

func _on_screen_existed() -> void:
	queue_free()
