//
//  43_1.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/9/23.
//  Copyright © 2020 RodinYTY. All rights reserved.
//

import Foundation
class Solution_43_1 {
    func multiply(_ num1: String, _ num2: String) -> String {
        let count1 = num1.count; let count2 = num2.count
        var res = [Int](repeating: 0, count: count1+count2)
        for i in stride(from: count2-1, through: 0, by: -1){
            for j in stride(from: count1-1, through: 0, by: -1){
                let idx1 = num1.index(num1.startIndex, offsetBy: j)
                let idx2 = num2.index(num2.startIndex, offsetBy: i)
                let mul = Int(num1[idx1...idx1])! * Int(num2[idx2...idx2])!
                res[i+j+1] += mul % 10
                res[i+j] += mul / 10
            }
        }
        var carry:Int = 0
        for i in stride(from: count1 + count2 - 2, through: 0, by: -1){
            res[i] += carry
            carry = res[i] / 10
            res[i] %= 10
        }
        var start = 0
        while start != count1 + count2 - 1 && res[start] == 0{
            start += 1
        }
        return res[start..<res.count].reduce(""){x, y in
            String(x) + String(y)
        }
    }
}
