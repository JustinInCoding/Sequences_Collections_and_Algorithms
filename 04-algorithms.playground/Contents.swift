// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation

struct FizzBuzz: RandomAccessCollection {
  
  typealias Index = Int
  
  var startIndex: Index {
    return 1
  }
  
  var endIndex: Index {
    return 101
  }
  
//  func index(after i: Index) -> Index {
//    print("Increment index to", i+1)
//    return i + 1
//  }
//
//  func index(before i: Index) -> Index {
//    return i - 1
//  }

  subscript (index: Index) -> String {
    
    print("Debug subscript", index)
    
    precondition(indices.contains(index), "out of 1-100")
    switch (index.isMultiple(of: 3), index.isMultiple(of: 5)) {
    case (false, false):
      return String(index)
    case (true, false):
      return "Fizz"
    case (false, true):
      return "Buzz"
    case (true, true):
      return "FizzBuzz"
    }
  }
}

//FizzBuzz().dropFirst(11).first!

for value in FizzBuzz().reversed().prefix(5) {
  print(value)
}

FizzBuzz().count

print(FizzBuzz().sorted())
