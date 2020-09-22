//
//  1480.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/7/6.
//  Copyright © 2020 RodinYTY. All rights reserved.
//
//数组动态和，送分题
class Solution1480 {
    func runningSum(_ nums: [Int]) -> [Int] {
        var sums = [Int](), sum = 0
        for i in nums{
            sum += i
            sums.append(sum)
        }
        return sums
    }
}
