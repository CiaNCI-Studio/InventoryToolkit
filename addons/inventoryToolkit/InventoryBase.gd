extends Control
class_name InventoryBase

signal InventoryUpdate

@export var Itens : Array[ItemStack] = [] 
@export var SlotCount : int = 8
@export var WeightLimit : int = 0
@export var SelectedItem : int = -1

func RefreshSlotSize():
	if SlotCount > len(Itens):
		var index = len(Itens) - 1 
		for item in range(len(Itens), SlotCount):
			Itens.append(ItemStack.new())
			
func AddItem(item : ItemBase) -> bool:
	for stack in Itens:
		if stack.Quantity() == 0 or (stack.ItemTypeId == item.TypeId and stack.FreeStack() > 0):
			stack.AddItem(item)
			emit_signal("InventoryUpdate")
			return true
	return false

func UseItem(index : int) -> ItemBase:
	var result = null
	if len(Itens) - 1 >= index and Itens[index].Quantity() > 0:
		result = Itens[index].GetItem()
		emit_signal("InventoryUpdate")
	return result

func UseSelectedItem() -> ItemBase:
	if SelectedItem > -1:
		return UseItem(SelectedItem)
	return null
