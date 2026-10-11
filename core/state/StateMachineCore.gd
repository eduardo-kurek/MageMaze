class_name StateMachineCore
extends RefCounted

signal state_changed(previous: StringName, current: StringName)

var _states: Array[State]
var _states_by_id: Dictionary = {}
var _current: State
var _ctx := StateContext.new()

func _init(states: Array[State]) -> void:
	_states = states

func start(actor: Node) -> void:
	if _states.is_empty():
		push_error("StateMachineCore precisa de pelo menos um estado")

	_ctx.actor = actor
	_ctx.delta = 0.0
	_ctx.time_in_state = 0.0

	_build_dictionary()
	_validate()

	var first := _states[0].id
	return _change_state(first)

func update(delta: float) -> void:
	if _current == null: return
	_ctx.delta = delta
	_ctx.time_in_state += delta

	for transition in _current.transitions:
		if transition.condition.evaluate(_ctx):
			_change_state(transition.target_state)
			break

	_current.update_physics(_ctx)

func stop() -> void:
	if _current != null:
		_current.exit(_ctx)
		_current = null

func get_current_state_id() -> StringName:
	return _current.id if _current != null else &""

func _build_dictionary() -> void:
	_states_by_id.clear()
	for state in _states:
		if state == null or state.id == &"" or _states_by_id.has(state.id):
			push_error("Máquina contém estado nulo, sem ID ou com ID repetido")
		for action in state.actions:
			if action == null:
				push_error("Estado '%s' contém ação nula" % state.id)
		_states_by_id[state.id] = state

func _validate() -> void:
	for state in _states:
		for transition in state.transitions:
			if transition == null or transition.condition == null:
				push_error("Estado '%s' contém transição sem condição" % state.id)
			if not _states_by_id.has(transition.target_state):
				push_error("Estado '%s' aponta para '%s', que não existe" % [state.id, transition.target_state])

func _change_state(id: StringName) -> bool:
	if not _states_by_id.has(id):
		push_error("Estado '%s' não existe" % id)
		return false
	if _current != null and _current.id == id:
		return true

	var previous: StringName = &""
	if _current != null:
		previous = _current.id
		_current.exit(_ctx)

	_current = _states_by_id[id]
	_ctx.time_in_state = 0.0
	_current.enter(_ctx)
	state_changed.emit(previous, id)
	return true
