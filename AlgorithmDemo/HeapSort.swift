//
//  HeapSort.swift
//  AlgorithmDemo
//
//  Created by Liang Wang (QXW7463) on 2021/5/28.
//

import Foundation

func heapInsert(_ array: inout [Int], _ index: Int) {
    var i = index
    while array[i] > array[(i - 1) / 2] {
        array.swapAt(i, (i - 1) / 2)
        i = (i - 1) / 2
    }
}

func heapify(_ array: inout [Int], _ index:  Int, _ size: Int) {
    var i = index
    var left = 2 * i + 1
    while left < size {
        var largest = (left + 1 < size && array[left + 1] > array[left]) ? left + 1 : left
        largest = array[largest] > array[i] ? largest : i
        if largest == i {
            break
        }
        array.swapAt(largest, i)
        i = largest
        left = 2 * i + 1
    }
}

func heapSort(_ array: inout [Int]) -> [Int] {
    if array.count < 2 {
        return array
    }
    
    for i in 0..<array.count {
        heapInsert(&array, i)
    }

    var size = array.count - 1
    array.swapAt(0, size)
    while size > 0 {
        heapify(&array, 0, size)
        size -= 1
        array.swapAt(0, size)
    }
    return array
}

func testHeapSort() {
    var arr = [2,4,6,3,1,5,7]
    arr = [26, 8, -12, 63, -62, -33, -90]
    _ = heapSort(&arr)
    print(arr)
}
