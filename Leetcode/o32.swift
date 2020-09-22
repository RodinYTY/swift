//
//  o33.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/9/22.
//  Copyright © 2020 RodinYTY. All rights reserved.
//

import Foundation
class Solution32 {
    var ret = [[Int]]()
    private func ret_append(_ at: Int, _ num: Int){
        if at >= ret.count{
            ret.append([Int]())
        }
        ret[at].append(num)
    }
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        levelOrderCore(root, 0)
        return ret
    }
    func levelOrderCore(_ node: TreeNode?, _ layer: Int){
        guard node != nil else{return}
        ret_append(layer, node!.val)
        levelOrderCore(node!.left, layer+1)
        levelOrderCore(node!.right, layer+1)
    }
}
