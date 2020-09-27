//
//  142.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/9/27.
//  Copyright © 2020 RodinYTY. All rights reserved.
//

import Foundation
class Solution142 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        var step = 2
        while fast != nil {
            fast = step == 2 ? fast!.next?.next : fast!.next
            slow = slow!.next
            if fast === slow {
                // 第二次相遇，或者第一次相遇，但相遇点是起始点，则相遇点已经找到
                if step == 1 || fast === head {
                    return fast
                }
                // 第一次相遇，修改slow位置及fast步伐step
                slow = head
                step = 1
            }
        }
        return nil
    }
}
