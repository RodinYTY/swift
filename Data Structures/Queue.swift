//
//  Queue.swift
//  Leetcode
//
//  Created by RodinYTY on 2020/9/22.
//  Copyright © 2020 RodinYTY. All rights reserved.
//

class Queue<T>{
    var elements = Array<T>()
    var count:Int{
        elements.count
    }
    var isEmpty:Bool{
        elements.isEmpty
    }
    var head:T?{
        elements.last
    }
    var rear:T?{
        elements.first
    }
    /// 初始化方法
    /// - Parameter array: 传入的数组
    init(withArray array:[T]){
        elements = array
    }
    
    func dequeue() -> T?{
        return elements.popLast()
    }
    
    func enqueue(elem:T){
        elements.insert(elem, at: 0)
    }
}
