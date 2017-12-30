import XCTest
@testable import MirrorExtensions

class MirrorTests: XCTestCase {
  func testChildrenMethodShouldReturnValidResults () {
    struct Struct {
      let integer1 = 1
      let boolean1 = true
      let string1 = "a"
      let integer2 = 2
      let boolean2 = false
      let integer3 = 3
    }

    let mirror = Mirror(reflecting: Struct())

    XCTAssertEqual(mirror.children(Int.self), [1, 2, 3])
    XCTAssertEqual(mirror.children(Bool.self), [true, false])
    XCTAssertEqual(mirror.children(String.self), ["a"])
    XCTAssertEqual(mirror.children(Float.self), [Float]())
  }

  func testDescendantsMethodShouldReturnValidResults () {
    struct Struct2 {
      let integer3 = 3
    }

    struct Struct1 {
      let integer2 = 2
      let boolean2 = false
      let struct2 = Struct2()
    }

    struct Struct {
      let integer1 = 1
      let boolean1 = true
      let string1 = "a"
      let struct1 = Struct1()
    }

    let mirror = Mirror(reflecting: Struct())

    XCTAssertEqual(mirror.descendants(Int.self), [1, 2, 3])
    XCTAssertEqual(mirror.descendants(Bool.self), [true, false])
    XCTAssertEqual(mirror.descendants(String.self), ["a"])
    XCTAssertEqual(mirror.descendants(Float.self), [Float]())
  }
}
