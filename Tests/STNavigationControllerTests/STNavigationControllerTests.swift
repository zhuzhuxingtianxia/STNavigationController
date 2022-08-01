import XCTest
@testable import STNavigationController

final class STNavigationControllerTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.b
        XCTAssert(UIImage.st.image(named: "nav_back") == nil, "is Pass")
    }
}
