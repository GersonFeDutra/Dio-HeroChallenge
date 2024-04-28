extends Node

const HANKS := {
	1000: "Iron",
	2000: "Bronze",
	5000: "Silver",
	7000: "Gold",
	8000: "Platinum",
	9000: "Ascendant",
	10000: "Imortal",
	INFI: "Radiant",
}

@export var hero_name: String:
	set = set_hero_name
func set_hero_name(value):
	hero_name = value
	%Hero.text = value

@export var hero_xp: int:
	set = set_hero_xp
func set_hero_xp(value: int) -> void:
	hero_xp = value
	
	for hank: int in ordered_hanks:
		if hero_xp < hank:
			self.current_hank = HANKS[hank]
			break

#region Interface setup code
var ordered_hanks := HANKS.keys()
func _ready() -> void:
	ordered_hanks
	%Hank.text = current_hank

var current_hank = HANKS[HANKS.keys()[0]]:
	set(value):
		var changed: bool = value != current_hank
		current_hank = value
		if changed:
			%Hank.text = value
			$Portrait.change_color(value)
			print(value)

## Infinity Integer: Max int value
const INFI = 9223372036854775807
#endregion

