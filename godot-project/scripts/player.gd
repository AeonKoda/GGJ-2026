class_name Player extends Node2D

signal player_died

var mask = "none"
var batMaskSonar = preload("res://scenes/bat_mask_sonar_area.tscn")
var maskPropertyNode

# This was added by Jarren for debbuging reasons. Allows for testing of player death signal
#func _ready() -> void:
	#var tween:Tween = create_tween()
	#tween.tween_interval(randf_range(1,3))
	#await tween.finished
	#player_died.emit()

func _process(delta: float) -> void:
	
	# use arrow keys to switch mask, use same arrow key to remove mask
	if Input.is_action_just_pressed("Mask1"):
		if mask == "bat":
			SwitchMask("none")
		else:
			SwitchMask("bat")
	if Input.is_action_just_pressed("Mask2"):
		if mask == "speed":
			SwitchMask("none")
		else:
			SwitchMask("speed")
	if Input.is_action_just_pressed("Mask3"):
		if mask == "reveal":
			SwitchMask("none")
		else:
			SwitchMask("reveal")


func SwitchMask(targetMask):
	ResetMaskProperties(mask)
	mask = targetMask
	$DebugLabel.text = mask
	match mask:
		
		"none":
			pass
		
		"bat":
			var sonarInstance = batMaskSonar.instantiate()
			get_node("EyeHeight").add_child(sonarInstance)
			maskPropertyNode = sonarInstance
		
		"speed":
			pass
		
		"reveal":
			pass

func ResetMaskProperties(targetMask):
	match targetMask:
		
		"none":
			pass
		
		"bat":
			maskPropertyNode.queue_free()
		
		"speed":
			pass
		
		"reveal":
			pass
	maskPropertyNode = null
