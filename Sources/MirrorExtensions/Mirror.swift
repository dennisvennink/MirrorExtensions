public extension Mirror {
  /// Creates an `Array` containing all of the children of `self` that conform to `T`.
  ///
  ///     struct Struct {
  ///       let integer1 = 1
  ///       let boolean1 = true
  ///       let string1 = "a"
  ///       let integer2 = 2
  ///       let boolean2 = false
  ///       let integer3 = 3
  ///     }
  ///
  ///     print(Mirror(reflecting: Struct()).children(Int.self))
  ///     // [1, 2, 3]
  ///
  /// - Parameters:
  ///   - type: A static metatype instance.
  /// - Returns: An `Array` containing all of the children of `self` that conform to `T`.
  func children <T> (_ type: T.Type) -> [T] {
    return self.children.map { $0.value }.filter { $0 is T } as! [T]
  }

  /// Creates an `Array` containing all of the descendants of `self` that conform to `T`.
  ///
  ///     struct Struct2 {
  ///       let integer3 = 3
  ///     }
  ///
  ///     struct Struct1 {
  ///       let integer2 = 2
  ///       let boolean2 = false
  ///       let struct2 = Struct2()
  ///     }
  ///
  ///     struct Struct {
  ///       let integer1 = 1
  ///       let boolean1 = true
  ///       let string1 = "a"
  ///       let struct1 = Struct1()
  ///     }
  ///
  ///     print(Mirror(reflecting: Struct()).descendants(Int.self))
  ///     // [1, 2, 3]
  ///
  /// - Parameters:
  ///   - type: A static metatype instance.
  /// - Returns: An `Array` containing all of the descendants of `self` that conform to `T`.
  func descendants <T> (_ type: T.Type) -> [T] {
    return self.children.map { $0.value }.flatMap { (element: Any) -> [T] in
      let mirror = Mirror(reflecting: element)

      if element is T {
        return [element as! T] + mirror.descendants(type)
      }

      return mirror.descendants(type)
    }
  }
}
