//
//  MergeArray.swift
//  AlgorithmDemo
//
//  Created by Liang Wang (QXW7463) on 2021/5/19.
//

import Foundation

func mergeArray(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> [Int] {
    var index1 = 0
    var index2 = 0
    
    while index2 < n {
        if nums1[index1] > nums2[index2] || index1 - index2 >= m {
            nums1.insert(nums2[index2], at: index1)
            index1 += 1
            index2 += 1
        } else if nums1[index1] <= nums2[index2] {
            index1 += 1
        }
    }
    return nums1
}
