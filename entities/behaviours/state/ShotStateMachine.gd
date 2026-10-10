class_name ShotStateMachine
extends Resource

@export var states: Array[ShotState] = []

var _current: ShotState
var _by_id: Dictionary = {}
var _time_in_state: float = 0.0

func start() -> void:
	_init_state_ids()
	_validate_transitions()
	_enter(states[0])
	
func _init_state_ids() -> void:
	_by_id.clear()
	for s in states:
		_by_id[s.id] = s

func _validate_transitions() -> void:
	for s in states:
		for t in s.transitions:
			if not _by_id.has(t.target_state):
				push_error("Estado '%s' tem transição para '%s', que não existe" % [s.id, t.target_state])

func _enter(state: ShotState) -> void:
	_current = state
	_time_in_state = 0.0
	state.enter()

func update_physics(ctx: EntityContext) -> void:
	_update_context(ctx)
	_evaluate_current_transitions(ctx)
	_update_physics_current(ctx)

func _update_context(ctx: EntityContext) -> void:
	_time_in_state += ctx.delta
	ctx.time_in_state = _time_in_state

func _evaluate_current_transitions(ctx: EntityContext) -> void:
	for t in _current.transitions:
		if t.condition and t.condition.evaluate(ctx):
			if _by_id.has(t.target_state):
				_enter(_by_id[t.target_state])
			return
			
func _update_physics_current(ctx: EntityContext) -> void:
	_current.update_physics(ctx)
