// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation

func infiniteBasic(value: Int) -> UnfoldSequence<Int, (Int?, Bool)> {
	return sequence(first: value) { _ in return value }
}

func infinite(value: Int) -> AnySequence<Int> {
	return AnySequence {
		sequence(first: value) { _ in return value }
	}
}

print("Get 5 values")
for value in infinite(value: 24).prefix(5) {
	print(value)
}


//func infiniteBasic(value: Int) -> UnfoldSequence<Int, (Int?, Bool)> {
// return sequence(first: value) { _ in return value }
//}
//
//print("Get 5 values")
//for value in infiniteBasic(value: 24).prefix(5) {
//  print(value)
//}
//
//func infinite(value: Int) -> AnySequence<Int> {
//  return AnySequence {
//    sequence(first: value) { _ in return value }
//  }
//}
//
//print("Get 5 values from InfiniteSequence")
//for value in infinite(value: 24).prefix(5) {
//  print(value)
//}
