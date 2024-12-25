extends Node
class_name ItemCommand

enum PropertyTypes {
	Hp,
	Speed,
	Atack
}

@export var Property : PropertyTypes
@export var Value : float = 0
@export var Duration : float = 0
