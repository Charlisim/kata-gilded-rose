import Foundation
public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        self.items = items.map({ item -> BaseItem in
            let itemType = ItemType(rawValue: item.name) ?? .regular
            let item =  self.getInternalItem(itemType: itemType, name: item.name, sellIn: item.sellIn, quality: item.quality)
            item.updateQuality()
            return item
        }).map { item -> Item in
            return Item(name: item.name, sellIn: item.sellIn, quality: item.quality)
        }
    }
    
    private func getInternalItem(itemType: ItemType, name: String, sellIn: Int, quality: Int) -> BaseItem {
        switch itemType {
        case .regular:
            return RegularItem(name: name, sellIn: sellIn, quality: quality)
        case .agedBrie:
            return AgedBrieItem(name: name, sellIn: sellIn, quality: quality)
        case .sulfuras:
            return SulfurasItem(name: name, sellIn: sellIn, quality: quality)
        case .backstagePasses:
            return BackstagePasses(name: name, sellIn: sellIn, quality: quality)
        case .conjured:
            return ConjuredItem(name: name, sellIn: sellIn, quality: quality)
        }
    }
}
