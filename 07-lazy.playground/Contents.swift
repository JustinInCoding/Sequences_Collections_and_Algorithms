// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

let random = Array(1...15).shuffled()
let evens = random.lazy.filter { $0.isMultiple(of: 2) }
print(type(of: evens))
print(evens)

let threePlus1 = evens.map { $0 + 1 }.prefix(3)
print(type(of: threePlus1))
threePlus1.forEach { print($0) }

struct FizzBuzz: RandomAccessCollection {
  
  typealias Index = Int
  
  var startIndex: Index {
    return 1
  }
  
  var endIndex: Index {
    return 101
  }
  
  subscript (position: Index) -> String {
    precondition(indices.contains(position), "out of 1-100")
    switch (position.isMultiple(of: 3), position.isMultiple(of: 5)) {
    case (false, false):
      return String(position)
    case (true, false):
      return "Fizz"
    case (false, true):
      return "Buzz"
    case (true, true):
      return "FizzBuzz"
    }
  }
}

let fizzBuzz = FizzBuzz()
let numberOfBuzzes = fizzBuzz.lazy.filter { $0 == "Buzz" }
print("Count", numberOfBuzzes.count)




