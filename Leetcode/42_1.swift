//
//  42_1.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/7/4.
//  Copyright © 2020 RodinYTY. All rights reserved.
//
//给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
//
//
//
//上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢 Marcos 贡献此图。
//
//示例:
//
//输入: [0,1,0,2,1,0,1,3,2,1,2,1]
//输出: 6
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/trapping-rain-water
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

import Foundation
//ans = S→ + S← + S柱
//count * h1 = S→ ∪ S← + S柱, h1是最高点
//S→ ∩ S← = S→ + S← - S→ ∪ S← = ans - count * h1
class Solution42_1 {
    func trap(_ height: [Int]) -> Int {
        var ans = 0, h1 = 0, h2 = 0
        for i in 0..<height.count{
            h1 = max(h1, height[i])
            h2 = max(h2, height[height.count-i-1])
            ans += h1 + h2 - height[i]
        }
        return ans - height.count * h1
    }
}
