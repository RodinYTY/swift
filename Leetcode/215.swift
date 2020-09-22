//
//  215.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/6/29.
//  Copyright © 2020 RodinYTY. All rights reserved.
//
//在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
//
//示例 1:
//
//输入: [3,2,1,5,6,4] 和 k = 2
//输出: 5
//示例 2:
//
//输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
//输出: 4
//说明:
//
//你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。

class Solution215 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        /// 记录前K个最大的数，降序排列
        var topK:[Int] = [], beg:Int, end:Int, mid:Int = 0
        for i in nums.indices{
            if topK.isEmpty{
                topK.append(nums[i])
            }
            //topK未满直接添加
            else if topK.count < k && nums[i] <= topK.last!{
                topK.append(nums[i])
            }
            //未满或满了但满足入列要求：比最小的大
            else if topK.count < k || topK.count == k && nums[i] > topK.last!{
                beg = 0
                end = topK.count - 1
                while beg <= end{
                    mid = (beg+end)/2
                    if topK[mid] == nums[i]{
                        (beg, end) = (mid, mid)
                        break
                    }
                    if topK[mid] > nums[i]{
                        beg = mid + 1
                    }
                    else{
                        end = mid - 1
                    }
                }
                //整理topK
                if beg != end{
                    if end == -1{
                        mid = 0
                    }
                    else{
                        mid = nums[i] > topK[end] ? end : beg
                    }
                }
                topK.insert(nums[i], at: mid)
                if topK.count == k + 1{
                    topK.removeLast()
                }
            }
        }
        return topK.last!
    }
}
