import XCTest
@testable import MirrorExtensions

class MirrorTests: XCTestCase {
  func testShouldReturnValidResults () {
    struct Struct {
      let string1 = "a"
      let integer1 = 1
      let boolean1 = true
      let string2 = "b"
      let integer2 = 2
      let boolean2 = false
      let string3 = "c"
    }

    XCTAssertEqual((Mirror(reflecting: Struct()).children() as [String]).count, 3)
    XCTAssertEqual((Mirror(reflecting: Struct()).children() as [Int]).count, 2)
    XCTAssertEqual((Mirror(reflecting: Struct()).children() as [Bool]).count, 2)
    XCTAssertEqual((Mirror(reflecting: Struct()).children() as [Float]).count, 0)
  }
}
