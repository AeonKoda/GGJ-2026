extends GPUParticles2D

@export var texture_rect: TextureRect
@export var speed: float = 200.0
@export var start_distance:float = 0.0

var perimeter: float
var distance_traveled: float = 0.0

func _ready() -> void:
	distance_traveled = start_distance

func _process(delta: float) -> void:
	distance_traveled += speed * delta
	position = get_position_on_boundary(distance_traveled)

func get_position_on_boundary(dist: float) -> Vector2:
	var rect = texture_rect.get_rect()
	var w = rect.size.x
	var h = rect.size.y
	perimeter = 2.0 * (w + h)
	
	# Loop the distance around the perimeter
	dist = fmod(dist, perimeter)
	if dist < 0:
		dist += perimeter
	
	var pos: Vector2
	
	if dist <= w:
		# Top edge: left to right
		pos = Vector2(dist, 0.0)
	elif dist <= w + h:
		# Right edge: top to bottom
		pos = Vector2(w, dist - w)
	elif dist <= 2.0 * w + h:
		# Bottom edge: right to left
		pos = Vector2(w - (dist - w - h), h)
	else:
		# Left edge: bottom to top
		pos = Vector2(0.0, h - (dist - 2.0 * w - h))

	
	return pos
