//
//  ViewController.swift
//  testSkil
//
//  Created by Pranav V K on 6/2/18.
//  Copyright © 2018 Pranav V K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        test()
        return
        hackerEarth1()
        //multiDimentionalArrayPuzzle()
        //forEachAndForIn()
        
        
        let name = ["a","b"]
        
        let array1 = [1,2,3,4,5,6,7]
        let intval = 7
        print("View did load")
        //redefineArray(array : array1 , intVal : intval)
        //operationThreadTest()
        let result = ipValidation(ipAddress: "0.10.192.255")
        let result1 = ipValidation(ipAddress: "10.192.255.0.0")
        let result2 = ipValidation(ipAddress: "10.192.255.a")
        let result3 = ipValidation(ipAddress: "10.192.255.@")
        let result4 = ipValidation(ipAddress: "10.192.255.")
        print(result)
        print(result1)
        print(result2)
        print(result3)
        print(result4)
        workWithHigherOrderFunction()
        
        
        var num1 = 10
        var num2 = 20
        
        var str1 = "ABC"
        var str2 = "XYZ"
        genericExample(a: &num1, b: &num2)
        print("num1 = \(num1) \t num2 = \(num2)")
        genericExample(a: &str1, b: &str2)
         print("str1 = \(str1) \t str2 = \(str2)")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func redefineArray(array : [Int] , intVal : Int)
    {
        var startIndx = 0
        var endInex = 0
        
        for i in 0...(array.count - intVal)
        {
            startIndx = i
            endInex = startIndx + (intVal - 1)
            let subArray = array[startIndx...endInex]
            print("\(subArray) ")
        }
    }
    
    func operationThreadTest()
    {
     let images = ["add_appliance","appliance_big_300_300","busy_indicator","hamburger","heart_shape","logo-1"]
        
    let queue = OperationQueue()
        
        for image in images {
            queue.addOperation {
                
                let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                let fileURL = DocumentDirURL.appendingPathComponent(image).appendingPathExtension("png")
                print(queue.debugDescription)
                print(fileURL)
            }
        }
        queue.maxConcurrentOperationCount = 20
        queue.waitUntilAllOperationsAreFinished()
    }
    
    func ipValidation(ipAddress : String) -> Bool
    {
    
        let parts = ipAddress.components(separatedBy: ".")
        let nums = parts.compactMap({Int($0)})
        print(nums)
        return parts.count == 4 && nums.count == 4 && nums.filter{$0 >= 0 && $0 < 256}.count == 4
    }
    
    func workWithHigherOrderFunction()
    {
        let arrayTest = [1,2,9,10,11,24,16,19,20,20,20,30,40,40,70,90,80,99,100]
        
        let sortedArray = arrayTest.sorted(by: >)
        print("Sorted Array = \(sortedArray)")
        
        let filteredArray = arrayTest.filter{ $0 >= 10 && $0 <= 20 && $0 % 2 == 1 }
        print("Filterd Array = \(filteredArray)")
        
        let mappedArray = arrayTest.map{ $0 * 10 }
        print("mapped Array = \(mappedArray)")
        
        let reducedArray = arrayTest.reduce("") { $0 + String($1)}
        print("reduced Array = \(reducedArray)")
        
    }
    
    func genericExample<T>(a : inout T, b : inout T)
    {
        let temp = a
        a = b
        b = temp
    }
    
    func forEachAndForIn()
    {
        let arrayForTest = ["Pranav","Reva","Mithwa","Pranay"]
        
        for name in arrayForTest {
            print("name", name)
        }
        
        arrayForTest.forEach { (name) in
            print("Name", name)
        }
        
        //You cannot use break or continue statement to exit the current call of the closure in forEach loop, but you can do the same in forIn loop.
        //Using return statement ForEach loop exits only for the current call in the closure while ForIn loop exits all the next subsequent calls as well
        
        
        //Enumerated : - Returns a sequence of pairs (n, x), where n represents a consecutive integer starting at zero and x represents an element of the sequence.
        
        for (index , name) in arrayForTest.enumerated() {
            print("\(index): \(name)")
        }
    }
    
    func multDimentionalArray() {
        
        let multDArray : [[Int]] = [[0,1,2],[3,4,5],[6,7,9]]
        var isDiagonal = true
        for index in 0..<multDArray.count {
            for idx in 0..<multDArray[index].count {
                
                if index != idx {
                    if multDArray[index][idx] != 0 {
                        isDiagonal = false
                    }
                }
            }
        }
        
        if isDiagonal  {
            print("is a diagonal Matrix")
        }
        else{
            print("Not a digonal matrix")
        }
    }
    
    func multiDimentionalArrayPuzzle() {
        let mn : String! = readLine()
        let components = mn.split(separator: " ")
        let m : Int = Int(components[0])!
        let n : Int = Int(components[1])!
        
        var multiDimentionalArray = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var resultArray = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        
        for indx1 in 0..<m {
            
            let stringValues : String! = readLine()
            let rowArray = stringValues.split(separator : " ")
            
            for indx2 in 0..<rowArray.count {
                multiDimentionalArray[indx1][indx2] = Int(rowArray[indx2])!
            }
        }
        
        
        for indx1 in 0..<multiDimentionalArray.count {
            
            for indx2 in 0..<multiDimentionalArray[indx1].count {
                
                resultArray[indx2][indx1] = multiDimentionalArray[indx1][indx2]
            }
        }
        
        for indx1 in 0..<resultArray.count {
            var strValue : String! = ""
            for indx2 in 0..<resultArray[indx1].count {
                strValue.append("\(resultArray[indx1][indx2]) ")
            }
            print(strValue!)
        }
        
    }
    
    func hacktest()
    {
       
        let arrayCount : Int = Int(readLine()!)!
        
        var intArray = [Int]()
        
        for _ in 0..<arrayCount {
            let intValue : Int = Int(readLine()!)!
            intArray.append(intValue)
        }
        
        for item in intArray.reversed() {
            print(item)
        }
    }
    
    func queueOperation() {
        
    }
    
    func hackerEarth1() {
        let noOfTC : Int! = Int("2")! //Int(readLine()!)!
        let values : String! = "3 15"//readLine()
        let components = values.split(separator: " ")
        
        for i in 0..<noOfTC {
            let value : Int = Int(components[i])!
            findResult(value: value)
        }
    }
    
    func findResult(value : Int) {
        
        for index in 1...value {
            if index % 3 == 0 && index % 5 == 0 {
                print("FizzBuzz")
            }
            else if index % 3 == 0  {
                print("Fizz")
            }
            else if index % 5 == 0 {
                print("Buzz")
            }
            else {
               print(index)
            }
        }
    }
    
    func test()
    {
        let rowsN : Int = 2//Int(readLine()!)!
        let columnM : Int = 2//Int(readLine()!)!
        
        var matrixArray = [[Int]](repeating: [Int](repeating: 0, count: rowsN), count: columnM)
        var reveredArray = [[Int]](repeating: [Int](repeating: 0, count: columnM), count: rowsN)
        
        for i in 0..<rowsN {
            let stringRowValues : String = "1 6"//readLine()!
            let rowComponets = stringRowValues.split(separator: " ")
        
            for j in 0..<columnM {
                let value = Int(rowComponets[j])!
                matrixArray[i][j] = value
            }
        }
        
        var sumArray = [Int]()
        
        for i in 0..<rowsN {
            var sum = 0
            for j in 0..<columnM {
                reveredArray[j][i] = matrixArray[i][j]
                sum += matrixArray[i][j]
            }
            sumArray.append(sum)
        }
        
        for i in 0..<reveredArray.count {
            var sum = 0
            for j in 0..<reveredArray[i].count {
                 sum += reveredArray[i][j]
            }
            sumArray.append(sum)
        }
        
        
        let noOfQuery : Int = 2//Int(readLine()!)!
        let _ : Int = 2//Int(readLine()!)!
        
        print(matrixArray)
        
        print(reveredArray)
        print(sumArray)
        
        var result = ""
        
        for _ in 0..<noOfQuery {
            let stringRowValues : String = "3 7"//readLine()!
            let range = stringRowValues.split(separator: " ")
            
            let lowerValue = Int(range[0])!
            let upperValue = Int(range[1])!
            
            let resultArray = sumArray.filter{ $0 >= lowerValue && $0 <= upperValue}
            result.append("\(resultArray.count) ")
            
        }
        
        print(result)
    }
}

