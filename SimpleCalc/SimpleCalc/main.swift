//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        switch args[args.count - 1] {
        case "count":
            return args.count - 1
        case "avg":
            return average(args)
        case "fact":
            return factorial(args[0])
        default:
            return calculateBasicExpression(args)
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    fileprivate func calculateBasicExpression(_ args: [String]) -> Int {
        guard let first = Int(args[0]), let second = Int(args[2]) else {
            print("unable to calculate expression")
            return -1
        }
        
        switch args[1] {
        case "+":
            return first + second
        case "-":
            return first - second
        case "/":
            return first / second
        case "%":
            return first % second
        case "*":
            return first * second
        default:
            print("unable to calculate expression")
            return -1
        }
    }
    
    fileprivate func average(_ values: [String]) -> Int {
        if values.count < 2 {
            return 0
        }
        
        var total = 0
        for i in 0..<values.count - 1 {
            guard let intValue = Int(values[i]) else {
                continue
            }
            total += intValue
        }
        return total / (values.count - 1)
    }
    
    fileprivate func factorial(_ val: String) -> Int {
        if val == "fact" {
            return 0
        }
        
        guard var intValue = Int(val) else {
            print("unable to calculate expression")
            return -1
        }
        
        var fact = 1
        while intValue > 0 {
            fact *= intValue
            intValue -= 1
        }
        return fact
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

