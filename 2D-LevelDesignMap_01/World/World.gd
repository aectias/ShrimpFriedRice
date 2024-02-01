extends Node2D

@export var goal_carrots = 5;
@export var goal_peas = 5;
@export var goal_green_onion = 5;
@export var goal_tomato = 5;
@export var goal_rice = 5;

var current_carrots = 0;
var current_peas = 0;
var current_green_onion = 0;
var current_tomato = 0;
var current_rice = 0;

@onready var playerNode = get_node("Player")

func updateCount(typeNum: int):
	match typeNum:
		0: 
			current_carrots += 1
			get_node("CanvasLayer/MarginContainer/HBoxContainer/MarginContainer/hud-carrots/count").set_text( str(current_carrots) + "/" + str(goal_carrots))
		1:
			current_green_onion += 1
			get_node("CanvasLayer/MarginContainer/HBoxContainer/MarginContainer3/hud-greenonion/count").set_text( str(current_green_onion) + "/" + str(goal_green_onion))
		2: 
			current_peas += 1
			get_node("CanvasLayer/MarginContainer/HBoxContainer/MarginContainer2/hud-peas/count").set_text( str(current_peas) + "/" + str(goal_peas))
		3:
			current_tomato += 1
			get_node("CanvasLayer/MarginContainer/HBoxContainer/MarginContainer4/hud-tomato/count").set_text( str(current_tomato) + "/" + str(goal_tomato))
		4:
			current_rice += 1
			get_node("CanvasLayer/MarginContainer/HBoxContainer/MarginContainer5/hud-rice/count").set_text( str(current_rice) + "/" + str(goal_rice))

## Switching between fullscreen and not fullscreen by pressing esc
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		swap_fullscreen_mode()

func swap_fullscreen_mode():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_ready():
	playerNode.collectible_collected.connect(updateCount)
	pass # Replace with function body.


func _on_bgm_finished():
	$BGM.play()
	pass # Replace with function body.
