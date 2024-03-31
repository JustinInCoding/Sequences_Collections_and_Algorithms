// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation

let array = Array(0...99)

let all = array[...]

let lower = array[..<50]
let upper = array[50...]
let some = array[20...50]
let more = array[10..<11]

let sum = some.reduce(0) { $0 + $1 }
sum

func computeSum1(values: [Int]) -> Int {
	return values.reduce(0) { $0 + $1 }
}
computeSum1(values: Array(some))

func computeSum2<S: Sequence>(values: S) -> S.Element where S.Element: Numeric {
	return values.reduce(0) { $0 + $1 }
}
computeSum2(values: some)

var hello = "Hello, 🌍"
if let range = hello.range(of: "🌍") {
	hello.replaceSubrange(range, with: "🌝!!!")
}
print(hello)

// substring
if let index = hello.firstIndex(of: "🌝") {
	let sun = hello[index...]
	print(type(of: sun))
	print(sun)
}

//let array = Array(0...99)
//
//let all = array[...]
//let lower = array[..<50]
//let upper = array[50...]
//let some = array[20...50]
//let more = array[10..<11]
//
//let sum = some.reduce(0) { $0 + $1 }
//sum
//
//func computeSum1(values: [Int]) -> Int {
//  return values.reduce(0) { $0 + $1 }
//}
//
//func computeSum2<S: Sequence>(values: S) -> S.Element where S.Element: Numeric {
//  return values.reduce(0) { $0 + $1 }
//}
//
//
//computeSum1(values: Array(some))
//
//computeSum2(values: some)
//
//var hello = "Hello, 🌍"
//if let range = hello.range(of: "🌍") {
//  hello.replaceSubrange(range, with: "🌝!!!")
//}
//print(hello)
//
//if let index = hello.firstIndex(of: "🌝") {
//  let sun = hello[index...]
//  print(type(of: sun))
//  print(sun)
//}

