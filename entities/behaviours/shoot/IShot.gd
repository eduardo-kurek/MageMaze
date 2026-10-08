class_name IShot
extends RefCounted

func fire(ctx: ShotContext) -> void:
	push_error("IShot.fire() não implementado em %s" % get_script().resource_path)
