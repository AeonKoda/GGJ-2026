extends Node2D

@onready var floor1: ColorRect = $Floor1 # change ColorRect to Sprite2D when we have floor sprites
@onready var floor2: ColorRect = $Floor2

@export var buildings: Dictionary # Key is the building sprite, value is the buildings width

var buildings_total_width: int = 0

func _ready() -> void:
	while buildings_total_width <= 1920:
		create_building(randi_range(0, 0))

func _process(delta: float) -> void:
	 # Floor Movement
	floor1.position.x -= 250 * delta
	floor2.position.x -= 250 * delta
	if floor1.position.x <= -1920:
		floor1.position.x = 1920
	if floor2.position.x <= -1920:
		floor2.position.x = 1920
	
	 # Building Movement
	buildings_total_width -= 250 * delta
	if buildings_total_width <= 1920:
			create_building(randi_range(0, 0))
	for building in $Buildings.get_children():
		building.position.x -= 250 * delta
		if building.position.x <= -(buildings[building.texture])/2:
			building.queue_free()

func create_building(building_id):
	var sprite = buildings.keys()[building_id]
	var width = buildings.values()[building_id]
	var building = Sprite2D.new()
	building.texture = sprite
	building.scale = Vector2(0.5, 0.5)
	building.position = Vector2(buildings_total_width + width/2, 379)
	buildings_total_width += width
	$Buildings.add_child(building)
