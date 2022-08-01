@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func testQualityDoesntIsNegative() throws {
        let items = [Item(name: "foo", sellIn: 1, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 0)
    }
    
    func testUpdateQualityRegualarItem() throws {
        let items = [Item(name: "foo", sellIn: 1, quality: 1)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 0)
    }
    
    func testUpdateDegradationAfterTwoDayPassed() throws {
        let items = [Item(name: "foo", sellIn: 1, quality: 5)]
        let app = GildedRose(items: items)
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 2)
    }
    func testUpdateDegradationAfterDayPassed() throws {
        let items = [Item(name: "foo", sellIn:-1, quality: 5)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 3)
    }
    
    func testAgeBrieIncreaseQualityTime() throws {
        let items = [Item(name: "Aged Brie", sellIn: 5, quality: 5)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 6)
    }
    
    func testAgeBrieIncreaseQualityTimeLimitDay() throws {
        let items = [Item(name: "Aged Brie", sellIn: 1, quality: 5)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 6)
    }
    func testAgeBrieIncreaseQualityTimeStopsAt50() throws {
        let items = [Item(name: "Aged Brie", sellIn: 5, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 50)
    }
    func testDayPassedIncreaseBrieQualityUntil50OnLimit() throws {
        let items = [Item(name: "Aged Brie", sellIn: -1, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 50)
    }
    func testDayPassedIncreaseBrieQualityUntil50() throws {
        let items = [Item(name: "Aged Brie", sellIn: -1, quality: 49)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 50)
    }
    
    func testDayPassedIncreaseDoubleSellInPassed() throws {
        let items = [Item(name: "Aged Brie", sellIn: -1, quality: 1)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 3)
    }
    func testSulfurasAlwaysKeepTheSameQuality() throws {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 5, quality: 20)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 20)
    }
    func testSulfurasAlwaysKeepTheSameQualityDayPassed() throws {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 20)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 20)
    }
    
    func testBackstageQualityIncreaseBy2_10Days() throws {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 5)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 7)
    }
    func testBackstageQualityIncreaseBy2_6Days() throws {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 6, quality: 5)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 7)
    }
    
    func testBackstageQualityIncreaseBy2_5Days() throws {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 5)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 8)
    }
    
    func testBackstageQualityIncreaseBy3_1Days() throws {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 1, quality: 5)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 8)
    }
    
    func testBackstageQualityDrops0_0Days() throws {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 5)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 0)
    }
    
    
    
}
