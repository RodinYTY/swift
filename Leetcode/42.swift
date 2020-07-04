//
//  42.swift
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


//太蠢了这个方法
class Solution42 {
    func fillGap(heightArray height: inout [Int], firstIndex first:inout Int, lastIndex last:inout Int) -> Int? {
        if height.count < 2 || first == last{
            return nil
        }
        while first != last && height[first] <= height[first+1]{
            first += 1
        }
        if first == last{
            return nil
        }
        while last != first && height[last] <= height[last-1]{
            last -= 1
        }
        if first == last{
            return nil
        }
        if first >= last{
            return nil
        }
        
        var area = 0, i = first
        while i < last{
            //找到梯度下降点
            while height[i] >= height[i+1]{
                i += 1
            }
            var l = i
            while l != first && height[l-1] <= height[l]{
                l -= 1
            }
            if l == first{
                //找到梯度最高点
                while height[i] <= height[i+1] && i != last{
                    i += 1
                }
                continue
            }
            //低洼点：l~i
    //        |
    //        | | |       |
    //        | | | | | | |
    //              l   i i+1
            let minH = min(height[l-1], height[i+1])
            area += (minH - height[i]) * (i - l + 1)
            height.replaceSubrange(l...i, with: repeatElement(minH, count: i-l+1))
            //找到梯度最高点
            while i != last && height[i] <= height[i+1]{
                i += 1
            }
        }
        return area > 0 ? area : nil
    }
    
    func trap(_ height: [Int]) -> Int {
        var h = height
        var first = 0, last = h.count - 1, sum = 0
        while let area = fillGap(heightArray: &h, firstIndex: &first, lastIndex: &last){
            sum += area
        }
        return sum
    }
}
