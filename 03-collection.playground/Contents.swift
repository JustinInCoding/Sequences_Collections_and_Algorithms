// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation

struct Fizzbuzz: Collection {
	typealias Index = Int
	
	var startIndex: Index {
		return 1
	}
	
	var endIndex: Index {
		return 101
	}
	
	func index(after i: Index) -> Int {
		return i + 1
	}
	
	subscript(index: Index) -> String {
		precondition(indices.contains(index), "out of range")
		switch (index.isMultiple(of: 3), index.isMultiple(of: 5)) {
			case (false, false):
				return String(describing: index)
			case (true, false):
				return "Fizz"
			case (false, true):
				return "Buzz"
			case (true, true):
				return "Fizzbuzz"
		}
	}
}

for value in Fizzbuzz() {
	print(value)
}

//struct FizzBuzz: Collection {
//  
//  typealias Index = Int
//  
//  var startIndex: Index {
//    return 1
//  }
//  
//  var endIndex: Index {
//    return 101
//  }
//  
//  func index(after i: Index) -> Index {
//    return i + 1
//  }
//  
//  func index(_ i: Int, offsetBy distance: Int) -> Int {
//    return i + distance
//  }
//  
//  subscript (index: Index) -> String {
//    precondition(indices.contains(index), "out of 1-100")
//    switch (index.isMultiple(of: 3), index.isMultiple(of: 5)) {
//    case (false, false):
//      return String(index)
//    case (true, false):
//      return "Fizz"
//    case (false, true):
//      return "Buzz"
//    case (true, true):
//      return "FizzBuzz"
//    }
//  }
//}
//
//for value in FizzBuzz() {
//  print(value)
//}
