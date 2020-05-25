//
//  Solution.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/5/25.
//  Copyright © 2020 RodinYTY. All rights reserved.
//

//给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
//示例 1:
//
//输入: num1 = "2", num2 = "3"
//输出: "6"
//示例 2:
//
//输入: num1 = "123", num2 = "456"
//输出: "56088"
//说明：
//
//num1 和 num2 的长度小于110。
//num1 和 num2 只包含数字 0-9。
//num1 和 num2 均不以零开头，除非是数字 0 本身。
//不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。
//通过次数63,041提交次数149,099

class Solution43 {
    func multiply(_ num1: String, _ num2: String) -> String {
        let count1 = num1.count; let count2 = num2.count
        var res = [Int](repeating: 0, count: count1+count2)
        for i in stride(from: count2-1, through: 0, by: -1){
            for j in stride(from: count1-1, through: 0, by: -1){
                let idx1 = num1.index(num1.startIndex, offsetBy: j)
                let idx2 = num2.index(num2.startIndex, offsetBy: i)
                let mul = Int(num1[idx1...idx1])! * Int(num2[idx2...idx2])!
                let p1 = i + j; let p2 = p1 + 1
                let sum = mul + res[p2]
                res[p2] = sum % 10
                res[p1] += sum / 10
            }
        }
        var str = String()
        var i:Int = 0
//        消除0
        while i < res.count && res[i] == 0{
            i += 1
        }
        if i == res.count{
            str += "0"
        }
        else{
            for j in i..<res.count{
                str += String(format: "%d", res[j])
            }
        }
        return str
    }
}
