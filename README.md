# MirrorExtensions

![](https://img.shields.io/badge/Language-Swift%204-F04C3E.svg) [![](https://img.shields.io/badge/License-MIT-lightgrey.svg)](https://github.com/dennisvennink/SequenceExtensions/blob/master/LICENSE.md)

_MirrorExtensions_ is a library that adds various extensions to the [`Mirror`](https://developer.apple.com/documentation/swift/mirror) protocol. It should integrate well without adding any ambiguities and is well-documented and tested.

## Table of Contents

- [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
- [Testing](#testing)
- [API](#api)
    - [Method Extensions on `Mirror`](#method-extensions-on-mirror)
        - [`children()`](#children)

## Installation

### Swift Package Manager

To install this package, add it to your project's `Package.swift` as a dependency:

```swift
.package(url: "https://github.com/dennisvennink/MirrorExtensions", from: "0.1.0")
```

Don't forget to specify the tools version at the top:

```swift
// swift-tools-version:4.0
```

Then, `import` it into your project:

```swift
import MirrorExtensions
```

## Testing

To perform the tests, run:

```
swift test
```

## API

### Method Extensions on `Mirror`

#### `children()`

Creates a `Collection` of elements that contains all of the children of `self` that conform to `T`.

##### Example

```swift
struct Struct {
  let boolean1 = true
  let integer1 = 1
  let string1 = "a"
  let boolean2 = false
  let integer2 = 2
  let string2 = "b"
  let integer3 = 3
}

print(Mirror(reflecting: Struct()).children() as [Int])
// [1, 2, 3]
```

##### Declaration

```swift
func children <T> () -> [T]
```

##### Parameters

None.

##### Returns

A `Collection` of elements that contains all of the children of `self` that conform to `T`.
