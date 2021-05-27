//
//  Comparator.swift
//  AlgorithmDemo
//
//  Created by Liang Wang (QXW7463) on 2021/5/27.
//

import Foundation

struct Student {
    var id: Int
    var name:String
    var score: Int
}

func comparator<T>(v1: T, v2: T) -> Bool {
    return (v1 as! Student).id >= (v2 as! Student).id
}

func sortStudentsById(students: inout [Student]) -> [Student] {
    students.sort(by: comparator)
    return students
}
