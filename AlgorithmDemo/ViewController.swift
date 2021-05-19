//
//  ViewController.swift
//  AlgorithmDemo
//
//  Created by yangyangmao on 2021/5/18.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = reverseString(str: "hello,world")
        print(result)
        
        var arr = [1,2,3,5,6,0,0,0]
        let res = mergeArray(&arr, 5, [4,7,8,10,13,40,50], 3)
        print(res)
    }
}

