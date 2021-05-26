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
 
        var testArr = [7,6,5,4,3,2,1,3,3]
        print(partition2(arr: &testArr, num: 3))
    }
}

