// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation

// A two dimensional array with non-integer indices.

struct Array2D<Element>: BidirectionalCollection, MutableCollection {
  
  let width, height: Int
  private var storage: [Element]

  init(width: Int, height: Int, repeating value: Element) {
    self.width = width
    self.height = height
    self.storage = Array(repeating: value, count: width*height)
  }
  
	// --------------------------
  struct Array2DIndex: Comparable {
    private(set) var x, y: Int
    static func <(lhs: Index, rhs: Index) -> Bool {
      return lhs.y < rhs.y ||
        (lhs.y == rhs.y && lhs.x < rhs.x)
    }
  }
  
  typealias Index = Array2DIndex
	// --------------------------

  var startIndex: Index {
    return Index(x: 0, y: 0)
  }
  
	// 以行的形式来遍历
  var endIndex: Index {
    return Index(x: 0, y: height)
  }
  
	// ============ important =================
  func index(before i: Index) -> Index {
    if i.x > 0 {
      return Index(x: i.x-1, y: i.y)
    }
    precondition(i.y > 0)
    return Index(x: width-1, y: i.y-1)
  }
  
  func index(after i: Index) -> Index {
    if i.x < width-1 {
      return Index(x: i.x+1, y: i.y)
    }    
    return Index(x: 0, y: i.y+1)
  }
	// ============ important =================
  
  func inBounds(index: Index) -> Bool {
    return (0..<width).contains(index.x) && (0..<height).contains(index.y)
  }
  
	// ---------------------------------
  subscript(index: Index) -> Element {
    get {
      precondition(inBounds(index: index), "out of bounds index \(index)")
      return storage[index.y*width + index.x]
    }
    set {
      precondition(inBounds(index: index), "out of bounds index \(index)")
      storage[index.y*width + index.x] = newValue
    }
  }
	// ---------------------------------
  
  subscript(x x: Int, y y: Int) -> Element {
    get {
      return self[Index(x: x, y: y)]
    }
    set {
      self[Index(x: x, y: y)] = newValue
    }
  }
}

var array = Array2D(width: 4, height: 3, repeating: UInt8(0))
array[x: 1, y: 1] = 13
array[x: 2, y: 1] = 14
array[x: 0, y: 2] = 8

// Row 0
array[x: 0, y: 0]
array[x: 1, y: 0]
array[x: 2, y: 0]
array[x: 3, y: 0]

// Row 1
array[x: 0, y: 1]
array[x: 1, y: 1]
array[x: 2, y: 1]
array[x: 3, y: 1]

// Row 2
array[x: 0, y: 2]
array[x: 1, y: 2]
array[x: 2, y: 2]
array[x: 3, y: 2]

for item in array.sorted() {
  print(item)
}
