//
//  CalculatorModel.swift
//  CalcWithMVC
//
//  Created by Nurlybek Mussin on 24.01.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import Foundation


enum Operation{
    case constant(Double)
    case unaryOperation((Double) -> Double)
    case binaryOperation((Double, Double) -> Double)
    case equals
    case clean
}

struct CalculatorModel {
    
    private var global_operation: Double?
 
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt),
        "+": Operation.binaryOperation({$0+$1}),
        "-": Operation.binaryOperation({$0-$1}),
        "*": Operation.binaryOperation({$0*$1}),
        "/": Operation.binaryOperation({$0/$1}),
        "=": Operation.equals,
        "%": Operation.unaryOperation({$0/100}),
        "+/-": Operation.unaryOperation({$0*(-1)}),
        "C": Operation.clean
    ]
    mutating func performOperation(_ operation: String) {
        let symbol = operations[operation]!
        switch symbol {
            case .constant(let value):
                global_operation = value
            case .unaryOperation(let function):
                if global_operation != nil{
                    global_operation = function(global_operation!)
                }
            case .binaryOperation(let function):
                if global_operation != nil{
                    saving = SavingFirstOperandAndFunction(firstOperand: global_operation!, function: function)
                }
            case .equals:
                if global_operation != nil{
                    global_operation = saving?.performOperationWith(global_operation!)
                }
            case .clean:
                global_operation = nil
                saving = nil
                break
        }
        
    }
    
    private var saving: SavingFirstOperandAndFunction?
    private struct SavingFirstOperandAndFunction{
        let firstOperand: Double
        let function: (Double, Double) -> Double
        
        func performOperationWith(_ secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    mutating func setOperand(_ operand: Double){
        global_operation = operand
    }
    var result: Double?{
        get{
            return global_operation
        }
    }
}
