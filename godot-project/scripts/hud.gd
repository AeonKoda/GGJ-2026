class_name HUD extends CanvasLayer

enum ABILITY{
	BAT_MASK,
	SPEED_MASK,
	REVEALER_MASK,
	CANDY_BAR,
	NO_MASK,
	NONE
}

@export var score_value: RichTextLabel

@export var ability_1: TextureRect
@export var ability_input_1: TextureRect
@export var ability_2: TextureRect
@export var ability_input_2: TextureRect
@export var ability_3: TextureRect
@export var ability_input_3: TextureRect
@export var ability_4: TextureRect
@export var ability_input_4: TextureRect
@export var ability_5: TextureRect
@export var ability_input_5: TextureRect


var currently_active:ABILITY

func _ready() -> void:
	pass
	#test
	#update_score(100)
	#currently_active = ABILITY.BAT_MASK
	#
	#var tween:Tween = create_tween()
	#tween.tween_interval(1)
	#await  tween.finished
	#_on_ability_activated(ABILITY.SPEED_MASK)
	
func get_ability_texture_rect(ability: ABILITY) -> TextureRect:
	match ability:
		ABILITY.BAT_MASK:
			return ability_1
		ABILITY.SPEED_MASK:
			return ability_2
		ABILITY.REVEALER_MASK:
			return ability_3
		ABILITY.CANDY_BAR:
			return ability_4
		ABILITY.NO_MASK:
			return ability_5
		_:
			return null

func get_ability_input_texture(ability: ABILITY) -> TextureRect:
	match ability:
		ABILITY.BAT_MASK:
			return ability_input_1
		ABILITY.SPEED_MASK:
			return ability_input_2
		ABILITY.REVEALER_MASK:
			return ability_input_3
		ABILITY.CANDY_BAR:
			return ability_input_4
		ABILITY.NO_MASK:
			return ability_input_5
		_:
			return null

func update_score(value)-> void:
	score_value.text = str(value)

func _on_ability_activated(ability:ABILITY)-> void:
	if (currently_active != ABILITY.NONE):
		deactivate_ability(currently_active)
	
	var ability_texture:TextureRect = get_ability_texture_rect(ability)
	ability_texture.modulate = Color.WHITE
	currently_active = ability

func deactivate_ability(ability:ABILITY)-> void:
	if ability != ABILITY.NONE:
		var ability_texture:TextureRect = get_ability_texture_rect(ability)
		ability_texture.modulate = Color.RED
		currently_active = ABILITY.NONE
	
