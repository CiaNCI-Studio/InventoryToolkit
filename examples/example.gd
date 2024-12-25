extends Control
@onready var inventory: Inventory = $Inventory
@onready var hp_label: Label = $HBoxContainer/HpLabel

var hp : int = 50

func _ready() -> void:
	for i in range(10):
		AddItem()
	hp_label.text = str(hp)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("item1"):
		UseItem(0)
	if Input.is_action_just_pressed("item2"):
		UseItem(1)
	if Input.is_action_just_pressed("item3"):
		UseItem(2)
	if Input.is_action_just_pressed("item4"):
		UseItem(3)
	if Input.is_action_just_pressed("item5"):
		UseItem(4)
	if Input.is_action_just_pressed("item6"):
		UseItem(5)
	if Input.is_action_just_pressed("item7"):
		UseItem(6)	
	if Input.is_action_just_pressed("item8"):
		UseItem(7)
	if Input.is_action_just_pressed("addItem"):
		AddItem()
	if Input.is_action_just_pressed("damage"):
		Damage()

func _process(delta: float) -> void:
	pass
	
func UseItem(index : int):
	var item = inventory.UseItem(index)
	if item:
		hp = hp + int(item.Commands[0])
		hp_label.text = str(hp)
				
func AddItem():
	inventory.AddItem(load("res://examples/HpUp.tscn").instantiate())	

func Damage():
	if hp >= 10:
		hp = hp - 10
		hp_label.text = str(hp)
