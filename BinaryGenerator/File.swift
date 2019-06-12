//
//  File.swift
//  BinaryGenerator
//
//  Created by RV on 6/11/19.
//  Copyright © 2019 RV. All rights reserved.
//

import Foundation

class BinaryCalculator{

    var decimalValueHolder = 0
    var binaryValueArr = [String]()
    
    func getDecimalToBinary(value: Int)-> String{
        // As "value" is let, making another variable ("temp") that can be change later
        var valueHoder = value
        
        resetBinaryValueArr()
        // Loop to generate the binery value
        while valueHoder>0{
            
            // Adding 0 or 1 as MSB
            binaryValueArr.insert(String(valueHoder%2),at: 0)
            
            // Dividing the value by 2
            valueHoder /= 2
            
        }
        
        binaryValueArr.insert("0", at: 0)
        
        return binaryValueArr.joined()
    }
    
    
    func validateBinary (binaryString: String) -> Bool{
        
        // Removes extra white spaces from input, and turn it into an array of String
        let binaryArray = Array(binaryString.trimmingCharacters(in: .whitespacesAndNewlines))
        
        var counter = binaryArray.count
        
        // If cunter is equal to 0 the input is empty
        if(counter <= 0){
            //return false
        }
        
        // For loop checks each character
        for i in binaryArray{
            
            // NOTE: counter goes MSB to LSB, decreasing counter by 1 in each round
            counter -= 1
            
            // Validating input, it has to be either 1 or 0
            if (i != "0" || i != "1"){
                return false
            }
        }
        return true
    }
    
    // Generates decimal value of given binary value while validating the input
    func getBinaryToDecimal(binaryString: String) -> Int{
        
        // Removes extra white spaces from input, and turn it into an array of String
        let binaryArray = Array(binaryString.trimmingCharacters(in: .whitespacesAndNewlines))
        
        var counter = binaryArray.count
        
        // If cunter is equal to 0 the input is empty
        if(counter <= 0){
            //return false
        }
        
        // For loop checks each character
        for i in binaryArray{
            
            // NOTE: counter goes MSB to LSB, decreasing counter by 1 in each round
            counter -= 1
            
            // Validating input, it has to be either 1 or 0
            if (i == "0" || i == "1"){
                
                // If it is 1, add 2^counter to decimalValue
                if (i == "1"){
                    decimalValueHolder += Int(pow(2.0, Double(counter)))
                }
                
            }else{
              
                return -1
                
            }
        }
        
        return decimalValueHolder
        
    }
    
    // Clears the binaryValueArray
    func resetBinaryValueArr(){
        
        binaryValueArr.removeAll()
    }
}
