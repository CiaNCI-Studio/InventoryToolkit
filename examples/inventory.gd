extends InventoryBase
class_name Inventory

var ItemTextures : Array[TextureRect] = []
var ItemLabels : Array[Label] = []
	
func _ready() -> void:
	ItemTextures.append($HUD/Item1)
	ItemTextures.append($HUD/Item2)
	ItemTextures.append($HUD/Item3)
	ItemTextures.append($HUD/Item4)
	ItemTextures.append($HUD/Item5)
	ItemTextures.append($HUD/Item6)
	ItemTextures.append($HUD/Item7)
	ItemTextures.append($HUD/Item8)	
	ItemLabels.append($HUD/ItemLabel1)
	ItemLabels.append($HUD/ItemLabel2)
	ItemLabels.append($HUD/ItemLabel3)
	ItemLabels.append($HUD/ItemLabel4)
	ItemLabels.append($HUD/ItemLabel5)
	ItemLabels.append($HUD/ItemLabel6)
	ItemLabels.append($HUD/ItemLabel7)
	ItemLabels.append($HUD/ItemLabel8)
	RefreshSlotSize()

func _on_inventory_update() -> void:
	var index = 0
	for texture in ItemTextures:
		texture.texture = null
	for label in ItemLabels:
		label.text = '0'
		label.visible = false
	for item in Itens:
		if item.ItemImageRef != '':
			ItemTextures[index].texture = load(item.ItemImageRef)
		if item.Quantity() > 1:
			ItemLabels[index].text = str(item.Quantity())
			ItemLabels[index].visible = true
		index += 1
		if index > len(ItemTextures):
			continue
	
	
