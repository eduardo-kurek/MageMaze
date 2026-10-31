class_name DamageIndicator
extends Node2D

@export var health: HealthComponent

@export var font := ThemeDB.fallback_font

const LABEL_WIDTH := 24.0
const DURATION := 0.4
const RISE_DISTANCE := 12

const FONT_SIZE := 10
const OUTLINE_SIZE := 3
var TEXT_COLOR := Color.from_string("#f7000d", Color.RED)
const OUTLINE_COLOR := Color.BLACK

func _ready() -> void:
	if health == null:
		push_error("HealthIndicator sem HealthComponent em '%s'" % get_parent().name)
		return
	health.damage_taken.connect(_on_damage_taken)

func _on_damage_taken(amount: int) -> void:
	var label := _create_label("-%d" % amount)
	get_parent().add_child(label)

	var origin := _get_spawn_position()
	var top_left := origin - Vector2(LABEL_WIDTH / 2.0, label.size.y / 2.0)
	label.global_position = top_left
	_animate(label, top_left)

func _get_spawn_position() -> Vector2:
	var center := (get_parent() as Node2D).global_position
	return center + Vector2(0, -5.0)

func _create_label(text: String) -> Label:
	var label := Label.new()
	label.text = text
	label.z_index = 100
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.custom_minimum_size = Vector2(LABEL_WIDTH, 0.0)
	label.add_theme_font_override("font", font)
	label.add_theme_font_size_override("font_size", FONT_SIZE)
	label.add_theme_color_override("font_color", TEXT_COLOR)
	label.add_theme_color_override("font_outline_color", OUTLINE_COLOR)
	label.add_theme_constant_override("outline_size", OUTLINE_SIZE)
	label.reset_size()
	return label

func _animate(label: Label, from: Vector2) -> void:
	var tween := label.create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(label, "global_position:y", from.y - RISE_DISTANCE, DURATION)
	tween.finished.connect(label.queue_free)
