private enum ItemType: String, RawRepresentable {
    case regular
    case agedBrie
    case sulfuras
    case backstagePasses
    
    init?(rawValue: String) {
        switch rawValue{
        case "Aged Brie":
            self = .agedBrie
        case "Backstage passes to a TAFKAL80ETC concert":
            self = .backstagePasses
        case "Sulfuras, Hand of Ragnaros":
            self = .sulfuras
        default:
            self = .regular
        }
    }
}

public class Item {
    public var name: String
    public var sellIn: Int
    public var quality: Int
    private var itemType: ItemType
    
    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
        self.itemType = ItemType(rawValue: name) ?? .regular
    }
}

extension Item: CustomStringConvertible {
    public var description: String {
        name + ", " + String(sellIn) + ", " + String(quality)
    }
}
