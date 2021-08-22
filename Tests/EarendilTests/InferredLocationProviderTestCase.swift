import XCTest
@testable import Earendil

final class InferredLocationProviderTestCase: XCTestCase {
    private var target: Earendil.InferredLocationProvider!
    
    override func setUp() {
        self.target = Earendil.InferredLocationProvider()
    }
    
    override func tearDown() {
        self.target = nil
    }
    
    func testHavingEmptyLocaleShouldNotReturnInferredLocation() {
        let identifier = ""
        self.target = Earendil.InferredLocationProvider({ Locale(identifier: identifier) })
        
        XCTAssertNil(self.target.inferredLocation, "unexpectedly returned location for '\(identifier)'")
    }
    
    func testHavingInvalidLocaleShouldNotReturnInferredLocation() {
        let identifier = "666"
        self.target = Earendil.InferredLocationProvider({ Locale(identifier: identifier) })
        
        XCTAssertNil(self.target.inferredLocation, "unexpectedly returned location for '\(identifier)'")
    }
    
    func testHavingContinentLocaleShouldNotReturnInferredLocation() {
        let identifier = "eu"
        self.target = Earendil.InferredLocationProvider({ Locale(identifier: identifier) })
        
        XCTAssertNil(self.target.inferredLocation, "unexpectedly returned location for '\(identifier)'")
    }
    
    func testHavingLanguageOnlyLocaleShouldNotReturnInferredLocation() {
        let identifier = "es"
        self.target = Earendil.InferredLocationProvider({ Locale(identifier: identifier) })
        
        XCTAssertNil(self.target.inferredLocation, "unexpectedly returned location for '\(identifier)'")
    }
    
    func testHavingEnglishUSLocaleShouldReturnInferredUSLocation() {
        let identifier = "en_US"
        self.target = Earendil.InferredLocationProvider({ Locale(identifier: identifier) })
        
        guard let inferredLocation = self.target.inferredLocation else {
            XCTFail("couldn't infer location for '\(identifier)'")
            return
        }

        XCTAssertEqual(inferredLocation.country.name, "United States of America")
        XCTAssertEqual(inferredLocation.region?.name, "Americas")
        XCTAssertEqual(inferredLocation.subregion?.name, "Northern America")
    }
    
    func testHavingEnglishUKLocaleShouldReturnInferredUKLocation() {
        let identifier = "en_UK"
        self.target = Earendil.InferredLocationProvider({ Locale(identifier: identifier) })
        
        guard let inferredLocation = self.target.inferredLocation else {
            XCTFail("couldn't infer location for '\(identifier)'")
            return
        }

        XCTAssertTrue(inferredLocation.country.name.starts(with: "United Kingdom"))
        XCTAssertEqual(inferredLocation.region?.name, "Europe")
        XCTAssertEqual(inferredLocation.subregion?.name, "Northern Europe")
    }
    
    func testHavingEnglishForeignLocaleShouldReturnInferredForeignLocation() {
        let identifier = "en_JP"
        self.target = Earendil.InferredLocationProvider({ Locale(identifier: identifier) })
        
        guard let inferredLocation = self.target.inferredLocation else {
            XCTFail("couldn't infer location for '\(identifier)'")
            return
        }

        XCTAssertEqual(inferredLocation.country.name, "Japan")
        XCTAssertEqual(inferredLocation.region?.name, "Asia")
        XCTAssertEqual(inferredLocation.subregion?.name, "Eastern Asia")
    }
    
    
    func testHavingRussianValidCountryLocaleShouldReturnRussiaInferredLocation() {
        let identifier = "ru_RU"
        self.target = Earendil.InferredLocationProvider({ Locale(identifier: identifier) })
        
        guard let inferredLocation = self.target.inferredLocation else {
            XCTFail("couldn't infer location for '\(identifier)'")
            return
        }

        XCTAssertEqual(inferredLocation.country.name, "Russian Federation")
        XCTAssertEqual(inferredLocation.region?.name, "Europe")
        XCTAssertEqual(inferredLocation.subregion?.name, "Eastern Europe")
    }
    
    func testHavingRussianForeignCountryLocaleShouldReturnForeignInferredLocation() {
        let identifier = "en_MD"
        self.target = Earendil.InferredLocationProvider({ Locale(identifier: identifier) })
        
        guard let inferredLocation = self.target.inferredLocation else {
            XCTFail("couldn't infer location for '\(identifier)'")
            return
        }

        XCTAssertEqual(inferredLocation.country.name, "Moldova, Republic of")
        XCTAssertEqual(inferredLocation.region?.name, "Europe")
        XCTAssertEqual(inferredLocation.subregion?.name, "Eastern Europe")
    }
    
    func testHavingSingleLanguageAndRegionLocaleShouldReturnInferredLocation() {
        let identifier = "pl_PL"
        self.target = Earendil.InferredLocationProvider({ Locale(identifier: identifier) })
        
        guard let inferredLocation = self.target.inferredLocation else {
            XCTFail("couldn't infer location for '\(identifier)'")
            return
        }

        XCTAssertEqual(inferredLocation.country.name, "Poland")
        XCTAssertEqual(inferredLocation.region?.name, "Europe")
        XCTAssertEqual(inferredLocation.subregion?.name, "Eastern Europe")
    }
    
}
