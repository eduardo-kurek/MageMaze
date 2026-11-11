class_name IntStat
extends Resource

signal stat_changed(old_value: int, new_value: int)

@export var base_value: int
@export var min_value: int
@export var max_value: int

var value: float:
	get: return _value

var _value := 0.0

func setup() -> void:
	_set_value(base_value)

func increase(amount: float) -> void:
	_set_value(_value + amount)

func decrease(amount: float) -> void:
	_set_value(_value - amount)

func _set_value(new_value: float) -> void:
	var old := _value
	print('setando stat, old: %s, new: %s' % [old, new_value])
	_value = clampf(new_value, min_value, max_value)
	if _value != old:
		stat_changed.emit(old, _value)
