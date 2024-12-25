extends Node
class_name ItemStack

@export var Itens : Array[ItemBase] = []
@export var StackMaxSize : int = 1
@export var ItemTypeId : String = ""
@export var ItemName : String = ""
@export var ItemImageRef : String = ""
@export var ItemDescription : String = ""

func GetItem() -> ItemBase:
	if len(Itens) > 0:
		if len(Itens) == 1:
			ItemTypeId = ""
			ItemName = ""
			ItemImageRef = ""
			ItemDescription = ""
			StackMaxSize = -1
		return Itens.pop_front()
	return null

func AddItem(item : ItemBase):
	if (item.TypeId == ItemTypeId or ItemTypeId == "") and (FreeStack() > 0 or len(Itens) == 0):
		ItemTypeId = item.TypeId
		ItemName = item.Name
		ItemImageRef = item.ImageRef
		ItemDescription = item.Description		
		StackMaxSize = item.MaxStack
		Itens.append(item)

func FreeStack() -> int:
	if StackMaxSize > 0:
		return StackMaxSize - len(Itens)
	return 9999
	
func Quantity() -> int:
	return len(Itens)
	
func TotalWeight() -> int:	
	var sum = 0
	for item in Itens:
		sum += item.Weight
	return sum
