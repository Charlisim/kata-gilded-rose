public enum ItemType: String, RawRepresentable {
    case regular
    case agedBrie
    case sulfuras
    case backstagePasses
    case conjured
    
    
    public init?(rawValue: String) {
        switch rawValue{
        case "Aged Brie":
            self = .agedBrie
        case "Backstage passes to a TAFKAL80ETC concert":
            self = .backstagePasses
        case "Sulfuras, Hand of Ragnaros":
            self = .sulfuras
        case "Conjured":
            self = .conjured
        default:
            self = .regular
        }
    }
    
    
}
public protocol BaseItem: AnyObject,CustomStringConvertible {
    var name: String { get set }
    var sellIn: Int { get set }
    var quality: Int { get set }
    var itemType: ItemType { get set }
    
    init(name: String, sellIn: Int, quality: Int)
    func updateQuality()
    
}
extension BaseItem {
    public var description: String {
        name + ", " + String(sellIn) + ", " + String(quality)
    }
}

public class RegularItem: BaseItem{
    
    
    public var name: String
    
    public var sellIn: Int
    
    public var quality: Int
    
    public var itemType: ItemType
    
    public required init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
        self.itemType = .regular
    }
    public func updateQuality() {
        if quality > 0 {
            self.quality = self.quality - 1
        }
        self.sellIn = self.sellIn - 1

        if sellIn < 0, quality > 0 {
            self.quality = self.quality - 1

        }

    }
    
}

public class ConjuredItem: BaseItem{
    
    
    public var name: String
    
    public var sellIn: Int
    
    public var quality: Int
    
    public var itemType: ItemType
    
    public required init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
        self.itemType = .regular
    }
    public func updateQuality() {
        if quality > 0 {
            self.quality = self.quality - 1
        }
        if quality > 0 {
            self.quality = self.quality - 1
        }
        self.sellIn = self.sellIn - 1

        if sellIn < 0, quality > 0 {
            self.quality = self.quality - 1

        }

    }
    
}
public class AgedBrieItem: BaseItem{
    public var name: String
    
    public var sellIn: Int
    
    public var quality: Int
    
    public var itemType: ItemType
    
    public required init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
        self.itemType = .agedBrie
    }
    public func updateQuality() {
        if self.quality < 50 {
            self.quality = self.quality + 1
            
        }
        
        self.sellIn = self.sellIn - 1
        
        if sellIn < 0, quality < 50 {
            self.quality = self.quality + 1
        }
        
        
    }
}
public class SulfurasItem: BaseItem{
    public var name: String
    
    public var sellIn: Int
    
    public var quality: Int
    
    public var itemType: ItemType
    
    public required init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
        self.itemType = .sulfuras
    }
    public func updateQuality() {
        
    }
}
public class BackstagePasses: BaseItem {
    public var name: String
    
    public var sellIn: Int
    
    public var quality: Int
    
    public var itemType: ItemType
    
    public required init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
        self.itemType = .backstagePasses
    }
    
    public func updateQuality() {
        if self.quality < 50 {
            self.quality = self.quality + 1
            if self.sellIn < 11, self.quality < 50  {
                self.quality = self.quality + 1
            } 
            
            if self.sellIn < 6, self.quality < 50 {
                self.quality = self.quality + 1
            }
        }
        
        self.sellIn = self.sellIn - 1
        if sellIn <= 0 {
            self.quality -= self.quality
        }
        
        
    }
}

public class Item {
    
    public var name: String
    public var sellIn: Int
    
    public var quality: Int

    
    required public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
        
    }
    
    
    
}


