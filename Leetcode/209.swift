//
//  Solution209.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/6/28.
//  Copyright © 2020 RodinYTY. All rights reserved.
//
//给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的连续子数组，并返回其长度。如果不存在符合条件的连续子数组，返回 0。
//
//
//
//示例：
//
//输入：s = 7, nums = [2,3,1,2,4,3]
//输出：2
//解释：子数组 [4,3] 是该条件下的长度最小的连续子数组。
//
//
//进阶：
//
//如果你已经完成了 O(n) 时间复杂度的解法, 请尝试 O(n log n) 时间复杂度的解法。

class Solution209 {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var surplus = -s, beg = 0, end = -1, minLen = Int.max
        //initialization
        while surplus < 0 && end != nums.count - 1{
            end += 1
            surplus += nums[end]
        }
        if end-beg+1<minLen{
            minLen=end-beg+1
        }
        //dissatisfied
        if surplus<0{
            return 0
        }
        while end != nums.count{
            //convergence
            if nums[beg] <= surplus{
                while surplus >= 0{
                    if surplus >= nums[beg]{
                        surplus -= nums[beg]
                        beg += 1
                    }
                    else{
                        break
                    }
                }
            }
            if end-beg+1<minLen{
                minLen=end-beg+1
            }
            end += 1
            if end != nums.count{
                surplus += nums[end]
            }
        }
        return minLen
    }
}
/**/
