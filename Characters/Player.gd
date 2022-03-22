extends KinematicBody2D

export(float) var move_speed = 200

var velocity : Vector2

func _physics_process(delta):
	var input = get_player_input()
	
	velocity = Vector2(
		input.x * move_speed, 
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_velocity)
		)
	
	move_and_slide(velocity)
	

func get_player_input():
	var input : Vector2
	
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	return input
