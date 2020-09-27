//
//  45.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/9/22.
//  Copyright © 2020 RodinYTY. All rights reserved.
//

import Foundation
class Solutiono45 {
    func minNumber(_ nums: inout [Int]) -> String {
        nums.sort(){num1, num2 in
            var x = num1, y = num2
            y *= 10
            x /= 10
            while x > 0{
                y *= 10
                x /= 10
            }
            let yx = y + num1
            x = num1
            y = num2
            x *= 10
            y /= 10
            while y > 0{
                x *= 10
                y /= 10
            }
            // let xy = x + num2
            return x + num2 < yx
        }
        return nums.reduce(""){ num1, num2 in
            String(num1) + String(num2)
        }
    }
}
