class_name DamageIndicator
extends Node2D

@export var health: HealthComponent

@export var font := ThemeDB.fallback_font
@export var font_size := 10
@export var font_color := Color.from_string("#f7000d", Color.RED)
@export var outline_size := 3
@export var outline_color := Color.BLACK

@export var spawn_offset := 7.0
@export var duration := 0.5
@export var distance := 12

const LABEL_WIDTH := 32.0


func _ready() -> void:
	if health == null:
		push_error("HealthIndicator sem HealthComponent em '%s'" % get_parent().name)
		return
	health.damage_taken.connect(_on_damage_taken)

func _on_damage_taken(amount: int) -> void:
	var label := _create_label("-%d" % amount)
	add_child(label)

	var spawn_position := Vector2(-LABEL_WIDTH / 2.0, -label.size.y / 2.0 - spawn_offset)
	label.position = spawn_position
	_animate(label, spawn_position)


func _create_label(text: String) -> Label:
	var label := Label.new()
	label.text = text
	label.z_index = 100
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.custom_minimum_size = Vector2(LABEL_WIDTH, 0.0)
	label.add_theme_font_override("font", font)
	label.add_theme_font_size_override("font_size", font_size)
	label.add_theme_color_override("font_color", font_color)
	label.add_theme_color_override("font_outline_color", outline_color)
	label.add_theme_constant_override("outline_size", outline_size)
	label.reset_size()
	return label

func _animate(label: Label, spawn_position: Vector2) -> void:
	var tween := label.create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_method(_update_label.bind(label, spawn_position), 0.0, 1.0, duration)
	tween.finished.connect(label.queue_free)

func _update_label(t: float, label: Label, spawn_position: Vector2) -> void:
	label.position = spawn_position + Vector2(0.0, -distance * t)
