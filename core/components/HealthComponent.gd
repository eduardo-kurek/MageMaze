class_name HealthComponent
extends Node

signal damage_taken(damage: int)
signal healed(amount: int)
signal health_changed(old_value: int, current_health: int)
signal died

@export var hurtbox: Area2D
@export var max_health := 800
@export var regen_amount := 0
@export_range(0.1, 60.0, 0.1, "or_greater") var regen_interval := 1.0

var _current_health: int
var _regen_timer := 0.0

func _ready() -> void:
	_current_health = max_health
	
	if hurtbox == null:
		push_error("HealthComponent sem hurtbox em '%s'" % get_parent().name)
		return
		
	hurtbox.area_entered.connect(_on_area_entered)

func _process(delta: float) -> void:
	_update_regen(delta)
	
func _update_regen(delta: float) -> void:
	if regen_amount <= 0 or _current_health <= 0 or _current_health >= max_health:
		_regen_timer = 0.0
		return

	_regen_timer += delta
	if _regen_timer >= regen_interval:
		_regen_timer -= regen_interval
		_set_health(_current_health + regen_amount)

func heal(amount: int) -> void:
	if amount <= 0 or _current_health <= 0:
		return

	var effective := mini(amount, max_health - _current_health)
	if effective <= 0:
		return

	_set_health(_current_health + effective)
	healed.emit(effective)

func revive() -> void:
	_set_health(max_health)

func _on_area_entered(other: Area2D) -> void:
	if other is DamageSource:
		take_damage(other.damage)

func take_damage(amount: int) -> void:
	if amount <= 0 or _current_health <= 0:
		return

	var effective := mini(amount, _current_health)

	_set_health(_current_health - effective)
	damage_taken.emit(effective)
	if _current_health == 0:
		died.emit()

func _set_health(new_value: int):
	var old_value := _current_health
	_current_health = new_value
	health_changed.emit(old_value, _current_health)
	
func set_max_health(_max_health: int):
	max_health = _max_health
	_current_health = maxi(_current_health, max_health)
