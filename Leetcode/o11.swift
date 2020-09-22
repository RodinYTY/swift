//
//  o11.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/9/22.
//  Copyright © 2020 RodinYTY. All rights reserved.
//

import Foundation
class Solutiono11 {
    func minArray(_ numbers: [Int]) -> Int {
        var low = 0, high = numbers.count - 1
        var mid:Int
        while low < high{
            mid = (high - low) / 2 + low
            if numbers[mid] < numbers[high]{
                high = mid
            }
            else if numbers[high] < numbers[mid]{
                low = mid + 1
            }
            else{
                high -= 1
            }
        }
        return numbers[high]
    }
}
