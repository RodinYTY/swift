//
//  56.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/9/20.
//  Copyright © 2020 RodinYTY. All rights reserved.
//

import Foundation

class Solution56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else{
            return intervals
        }
        var intervals = intervals
        intervals.sort(){
            if $0.first != $1.first{
                return $0.first! < $1.first!
            }
            else{
                return $0.last! < $1.last!
            }
        }
        var res:[[Int]] = [[intervals[0][0], intervals[0][0]]]
        for elem in intervals{
            let last = res.last!
            if last[0] <= elem[0] && elem[0] <= last[1]{
                res[res.count - 1][1] = max(last[1], elem[1])
            }
            else{
                res.append(elem)
            }
        }
        return res
    }
}
