//
//  ReverseListNode.swift
//  AlgorithmDemo
//
//  Created by Liang Wang (QXW7463) on 2021/5/19.
//

import Foundation

/// 单链表定义
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/// 反转从位置 m 到 n 的链表， 使用一趟扫描完成
/// 1 <= m <= n <= 链表长度
func reverseListNode(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    if head == nil {
        return nil
    }
    let dummy = ListNode(0)
    dummy.next = head
    
    var pre: ListNode? = dummy
    for _ in 0..<(m - 1) {
        pre = pre?.next
    }
    
    let start: ListNode? = pre?.next
    var end: ListNode? = start?.next
    for _ in 0..<(n-m) {
        start?.next = end?.next
        end?.next = pre?.next
        pre?.next = end
        end = start?.next
    }
    return dummy.next
}
