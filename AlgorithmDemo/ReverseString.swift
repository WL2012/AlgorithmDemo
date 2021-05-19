//
//  ReverseString.swift
//  AlgorithmDemo
//
//  Created by yangyangmao on 2021/5/18.
//

import Foundation

func reverseString(str: String) -> String {
    guard str.count > 1 else {
        return str
    }
    ///"hello,world" 11
    ///
    var chars = str.utf8CString
    var low = 0
    var high = chars.count - 2
    while low < high {
        chars.swapAt(low, high)
        low += 1
        high -= 1
    }
    return String(cString: Array(chars))
}
