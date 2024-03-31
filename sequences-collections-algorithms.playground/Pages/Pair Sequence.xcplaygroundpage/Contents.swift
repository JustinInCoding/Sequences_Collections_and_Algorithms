// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation

let elements = ["A", "B", "C", "D"]

print("All Unique Pairs of Elements")

for (index, first) in elements.enumerated() {
  for second in elements.dropFirst(index+1) {
    print(first, second)
  }
}

print("Sequence Version")

public extension Collection {
  func pairs() -> AnySequence<(Element, Element)> {
    guard var index1 = index(startIndex, offsetBy: 0, limitedBy: endIndex),
      var index2 = index(index1, offsetBy: 1, limitedBy: endIndex)
      else {
        return AnySequence { EmptyCollection.Iterator() }
    }
    return AnySequence {
      AnyIterator {
        if index1 >= self.endIndex || index2 >= self.endIndex {
          return nil
        }
        defer {
          index2 = self.index(after: index2)
          if index2 >= self.endIndex {
            index1 = self.index(after: index1)
            index2 = self.index(after: index1)
          }
        }
        return (self[index1], self[index2])
      }
    }
  }
}

for (first, second) in elements.pairs() {
  print(first, second)
}

