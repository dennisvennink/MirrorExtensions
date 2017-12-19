import XCTest
@testable import MirrorExtensions

class MirrorTests: XCTestCase {
  func testShouldReturnValidResults () {
    struct Struct {
      let integer1 = 1
      let boolean1 = true
      let string1 = "a"
      let integer2 = 2
      let boolean2 = false
      let string2 = "b"
      let integer3 = 3
    }

    let mirror = Mirror(reflecting: Struct())

    XCTAssertEqual(mirror.children(String.self).count, 2)
    XCTAssertEqual(mirror.children(Int.self).count, 3)
    XCTAssertEqual(mirror.children(Bool.self).count, 2)
    XCTAssertEqual(mirror.children(Float.self).count, 0)
  }
}
