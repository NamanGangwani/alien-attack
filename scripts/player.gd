extends CharacterBody2D

signal took_damage

@export var speed = 300

@onready var rocket_shot_sound = $RocketShotSound

var rocket_scene = preload("res://scenes/rocket.tscn")

@onready var rocket_container = $RocketContainer # identical to get_node("RocketContainer")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
		
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0, 0), screen_size)

func shoot() -> void:
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 80
	rocket_shot_sound.play()
	
func take_damage() -> void:
	emit_signal("took_damage")
	
func die() -> void:
	queue_free()
