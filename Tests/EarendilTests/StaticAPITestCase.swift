import XCTest
@testable import Earendil

final class StaticAPITestCase: XCTestCase {
    func testCallingStaticShorthandWithDefaultLocaleShouldReturnTheSameValueAsDirectCall() {
        let staticShorthandLocation = Earendil.inferredLocation
        let directCallLocation = Earendil.InferredLocationProvider().inferredLocation
        
        XCTAssertEqual(staticShorthandLocation, directCallLocation)
    }
}
