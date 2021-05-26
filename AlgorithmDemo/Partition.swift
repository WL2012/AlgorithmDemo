//
//  Partition.swift
//  AlgorithmDemo
//
//  Created by Liang Wang (QXW7463) on 2021/5/26.
//

import Foundation


func partition2(arr: inout [Int], num: Int) -> (Int, Int) {
    var cur = 0;
    var less = cur - 1
    var more = arr.count
    while cur < more {
        if (arr[cur] < num) {
            less += 1
            arr.swapAt(less, cur)
            cur += 1
        } else if (arr[cur] > num)  {
            more -= 1
            arr.swapAt(cur, more)
        } else {
            cur += 1
        }
    }
    return (less+1, more-1)
}

func partition1(arr: inout [Int], num: Int) -> [Int] {
    var less = -1
    var cur = 0
    while cur < arr.count {
        if (arr[cur] < num) {
            less += 1
            arr.swapAt(less, cur)
            cur += 1
        } else  {
            cur += 1
        }
    }
    return arr
}
