# scripts/core/Interactable.gd
extends Area3D
class_name Interactable

@export var prompt_text: String = "Interact"
@export var use_distance: float = 3.0

signal interacted(by: Node)

func can_interact(by: Node) -> bool:
	return true

func interact(by: Node) -> void:
	emit_signal("interacted", by)
