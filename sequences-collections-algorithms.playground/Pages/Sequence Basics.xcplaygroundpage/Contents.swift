// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation

////////////////////////////////////////////////////////////////////////////////
// Sequence Basics

struct InfiniteIterator: IteratorProtocol {
  let value: Int
  mutating func next() -> Int? {
    return value
  }
}

var iterator = InfiniteIterator(value: 42)
iterator.next()
iterator.next()
iterator.next()


struct InfiniteSequence: Sequence {
  let value: Int
  func makeIterator() -> InfiniteIterator {
    return InfiniteIterator(value: value)
  }
}

print("Get 5 values from InfiniteSequence")
let infinite = InfiniteSequence(value: 24)
for value in infinite.prefix(5) {
  print(value)
}

