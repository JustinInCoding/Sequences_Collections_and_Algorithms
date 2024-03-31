// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation

func infinite(value: Int) -> AnySequence<Int> {
	return AnySequence<Int> { AnyIterator<Int> { value } }
}

for value in repeatElement(24, count: 5) {
	print(value)
}

//func infinite(value: Int) -> AnySequence<Int> {
//  return AnySequence<Int> { AnyIterator<Int> { value } }
//}
//
//print("Get 5 values")
//for value in infinite(value: 24).prefix(5) {
//  print(value)
//}
//
//// BTW, you would actually use this if you needed to do this
//
//for value in repeatElement(24, count: 5) {
//  print(value)
//}
