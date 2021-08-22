import XCTest
@testable import Earendil

final class JsonResourcesTestCase: XCTestCase {
    
    func testCountriesJsonResourceNameIsContainedInPackageBundle() {
        XCTAssertNotNil(Bundle.module.url(forResource: Earendil.Resource.countriesList, withExtension: nil))
    }
    
    func testRegionJsonResourceNameIsContainedInPackageBundle() {
        XCTAssertNotNil(Bundle.module.url(forResource: Earendil.Resource.regionsList, withExtension: nil))
    }
    
    func testSubregionJsonResourceNameIsContainedInPackageBundle() {
        XCTAssertNotNil(Bundle.module.url(forResource: Earendil.Resource.subregionsList, withExtension: nil))
    }
    
    func testDecodingCountriesJsonShouldProduce249ElementsCountriesArray() {
        let entries = Bundle.module.decode(Earendil.Json.Country.self, from: Earendil.Resource.countriesList)
        let targetCount = 249
        
        XCTAssertEqual(entries.count, targetCount)
    }
    
    func testDecodingRegionsJsonShouldProduce6ElementsRegionsArray() {
        let entries = Bundle.module.decode(Earendil.Json.Region.self, from: Earendil.Resource.regionsList)
        let targetCount = 6
        
        XCTAssertEqual(entries.count, targetCount)
    }
    
    func testDecodingSubregionsJsonShouldProduce18ElementsSubregionsArray() {
        let entries = Bundle.module.decode(Earendil.Json.Region.self, from: Earendil.Resource.subregionsList)
        let targetCount = 18
        
        XCTAssertEqual(entries.count, targetCount)
    }
    
    func testCountriesJsonEntriesShouldHaveUniqueAlphaCodes() {
        let decodingType = Earendil.Json.Country.self
        let resourceFile = Earendil.Resource.countriesList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let ids = entries.map({ $0.alpha })
        
        XCTAssertEqual(ids.removedDuplicates.count, ids.count, "at least one entry in \(resourceFile) has a duplicated id")
    }
    
    func testCountriesJsonEntriesShouldHaveUniqueNames() {
        let decodingType = Earendil.Json.Country.self
        let resourceFile = Earendil.Resource.countriesList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let names = entries.map({ $0.name })
        
        XCTAssertEqual(names.removedDuplicates.count, names.count, "at least one entry in \(resourceFile) has a duplicated name")
    }
    
    func testCountriesJsonEntriesShouldPointToValidRegions() {
        let decodingType = Earendil.Json.Country.self
        let resourceFile = Earendil.Resource.countriesList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let regionIds = Bundle.module.decode(Earendil.Json.Region.self, from: Earendil.Resource.regionsList).map({ $0.id })
        
        XCTAssertTrue(entries.map({ $0.region }).allSatisfy({ regionCode in regionIds.contains(regionCode) }))
    }
    
    func testCountriesJsonEntriesShouldPointToValidSubregions() {
        let decodingType = Earendil.Json.Country.self
        let resourceFile = Earendil.Resource.countriesList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let subregionIds = Bundle.module.decode(Earendil.Json.Region.self, from: Earendil.Resource.subregionsList).map({ $0.id })
        
        XCTAssertTrue(entries.map({ $0.subregion }).allSatisfy({ subregionCode in subregionIds.contains(subregionCode) }))
    }
    
    func testRegionsJsonEntriesShouldHaveUniqueIds() {
        let decodingType = Earendil.Json.Region.self
        let resourceFile = Earendil.Resource.regionsList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let ids = entries.map({ $0.id })
        
        XCTAssertEqual(ids.removedDuplicates.count, ids.count, "at least one entry in \(resourceFile) has a duplicated id")
    }
    
    func testRegionsJsonEntriesShouldHaveUniqueNames() {
        let decodingType = Earendil.Json.Region.self
        let resourceFile = Earendil.Resource.regionsList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let names = entries.map({ $0.name })
        
        XCTAssertEqual(names.removedDuplicates.count, names.count, "at least one entry in \(resourceFile) has a duplicated name")
    }
    
    func testSubregionsJsonEntriesShouldHaveUniqueIds() {
        let decodingType = Earendil.Json.Region.self
        let resourceFile = Earendil.Resource.subregionsList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let ids = entries.map({ $0.id })
        
        XCTAssertEqual(ids.removedDuplicates.count, ids.count, "at least one entry in \(resourceFile) has a duplicated id")
    }
    
    func testSubregionsJsonEntriesShouldHaveUniqueNames() {
        let decodingType = Earendil.Json.Region.self
        let resourceFile = Earendil.Resource.subregionsList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let names = entries.map({ $0.name })
        
        XCTAssertEqual(names.removedDuplicates.count, names.count, "at least one entry in \(resourceFile) has a duplicated name")
    }
    
    func testCountriesJsonEntriesShouldHaveValidNames() {
        let decodingType = Earendil.Json.Country.self
        let resourceFile = Earendil.Resource.countriesList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let names = entries.map({ $0.alpha })
        let areAllValid = names.allSatisfy({ !$0.isEmptyNoWhitespaces && !$0.starts(with: " ") })
        
        XCTAssertTrue(areAllValid)
    }
    
    func testCountriesJsonEntriesShouldHaveValidAlphaCodes() {
        let decodingType = Earendil.Json.Country.self
        let resourceFile = Earendil.Resource.countriesList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let names = entries.map({ $0.alpha })
        let areAllValid = names.allSatisfy({ !$0.isEmptyNoWhitespaces && $0.count == 2 && !$0.starts(with: " ") })
        
        XCTAssertTrue(areAllValid)
    }
    
    func testRegionsJsonEntriesShouldHaveValidNames() {
        let decodingType = Earendil.Json.Region.self
        let resourceFile = Earendil.Resource.regionsList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let names = entries.map({ $0.name })
        let areAllValid = names.allSatisfy({ !$0.isEmptyNoWhitespaces && !$0.starts(with: " ")})
        
        XCTAssertTrue(areAllValid)
    }
    
    func testRegionsJsonEntriesShouldHaveValidIds() {
        let decodingType = Earendil.Json.Region.self
        let resourceFile = Earendil.Resource.regionsList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let ids = entries.map({ $0.id })
        let areAllValid = ids.allSatisfy({ $0 < 10 && $0 >= 0 })
        
        XCTAssertTrue(areAllValid)
    }
    
    func testSubregionsJsonEntriesShouldHaveValidNames() {
        let decodingType = Earendil.Json.Region.self
        let resourceFile = Earendil.Resource.subregionsList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let names = entries.map({ $0.name })
        let areAllValid = names.allSatisfy({ !$0.isEmptyNoWhitespaces && !$0.starts(with: " ")})
        
        XCTAssertTrue(areAllValid)
    }
    
    func testSubregionsJsonEntriesShouldHaveValidIds() {
        let decodingType = Earendil.Json.Region.self
        let resourceFile = Earendil.Resource.subregionsList
        
        let entries = Bundle.module.decode(decodingType, from: resourceFile)
        let ids = entries.map({ $0.id })
        let areAllValid = ids.allSatisfy({ $0 >= 10 })
        
        XCTAssertTrue(areAllValid)
    }
}

private extension Array where Element: Hashable {
    var removedDuplicates: Self {
        Array(Set(self))
    }
}

private extension String {
    /**
     Returns `true` if string is empty or is constructed from whitespaces / newlines only.
     
     - Note: Will return `true` when the string is empty (`""`), and also returns `true` if string has only whitespaces (eg. `" "`, `"\n"`, `"\n "`).
     */
    var isEmptyNoWhitespaces: Bool {
        filter ({ !CharacterSet.whitespacesAndNewlines.contains($0.unicodeScalars.first!) }).isEmpty
    }
}
