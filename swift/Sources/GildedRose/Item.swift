public enum ItemType: String, RawRepresentable {
    case regular
    case agedBrie
    case sulfuras
    case backstagePasses
    
    
    public init?(rawValue: String) {
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
        guard quality > 0 else {
            return
        }
        self.quality = self.quality - 1
        self.sellIn = self.sellIn - 1
        guard sellIn < 0, quality > 0 else {
            return
        }
        self.quality = self.quality - 1

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
        
        guard sellIn > 0, quality < 50 else {
            return
        }
        self.quality = self.quality + 1
        
        
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
        if sellIn == 0 {
            self.quality -= self.quality
        }
        
        
    }
}

public class Item {
    
    public var name: String {
        get{
            return self.internalItem.name
        }
        set {
            self.internalItem.name = newValue
        }
    }
    public var sellIn: Int{
        get{
            return self.internalItem.sellIn
        }
        set {
            self.internalItem.sellIn = newValue
        }
    }
    
    public var quality: Int
    {
        get{
            return self.internalItem.quality
        }
        set {
            self.internalItem.quality = newValue
        }
    }
    public var itemType: ItemType
    var internalItem: BaseItem
    
    required public init(name: String, sellIn: Int, quality: Int) {
        self.itemType = ItemType(rawValue: name) ?? .regular
        switch itemType {
        case .regular:
            self.internalItem = RegularItem(name: name, sellIn: sellIn, quality: quality)
        case .agedBrie:
            self.internalItem = AgedBrieItem(name: name, sellIn: sellIn, quality: quality)
        case .sulfuras:
            self.internalItem = SulfurasItem(name: name, sellIn: sellIn, quality: quality)
        case .backstagePasses:
            self.internalItem = BackstagePasses(name: name, sellIn: sellIn, quality: quality)
        }
    }
    
    public func updateQuality() {
        self.internalItem.updateQuality()
        
        if self.sellIn < 0 {
            if self.name != "Aged Brie" {
                if self.name != "Backstage passes to a TAFKAL80ETC concert" {
//                    if self.quality > 0 {
//                        if self.name != "Sulfuras, Hand of Ragnaros" {
//                            self.quality = self.quality - 1
//                        }
//                    }
                } else {
                    self.quality = self.quality - self.quality
                }
            } else {
                if self.quality < 50 {
                    self.quality = self.quality + 1
                }
            }
            
        }
    }
    
}


