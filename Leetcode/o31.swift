//
//  o32.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/9/22.
//  Copyright © 2020 RodinYTY. All rights reserved.
//

import Foundation

class Solutiono31 {
    func levelOrder(_ root: TreeNode?) -> [Int] {
        var ret = [Int]()
        var q = Queue(withArray: [TreeNode]())
        if let node = root{
            ret.append(node.val)
            q.enqueue(elem: node)
        }
        while !q.isEmpty{
            let node = q.dequeue()!
            if let n1 = node.left{
                ret.append(n1.val)
                q.enqueue(elem: n1)
            }
            if let n2 = node.right{
                ret.append(n2.val)
                q.enqueue(elem: n2)
            }
        }
        
        return ret
    }
}
