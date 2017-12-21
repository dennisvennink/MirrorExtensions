public extension Mirror {
  /// Creates an `Array` that contains, as elements, all of the children of `self` that conform to `T`.
  ///
  ///     struct Struct {
  ///       let integer1 = 1
  ///       let boolean1 = true
  ///       let string1 = "a"
  ///       let integer2 = 2
  ///       let boolean2 = false
  ///       let string2 = "b"
  ///       let integer3 = 3
  ///     }
  ///
  ///     print(Mirror(reflecting: Struct()).children(Int.self))
  ///     // [1, 2, 3]
  ///
  /// - Returns: An `Array` that contains, as elements, all of the children of `self` that conform to `T`.
  func children <T> (_ type: T.Type) -> [T] {
    return self.children.filter { $0.value as? T != nil }.map { $0.value as! T }
  }
}
