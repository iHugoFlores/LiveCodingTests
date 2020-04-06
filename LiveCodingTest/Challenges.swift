//
//  Challenges.swift
//  LiveCodingTest
//
//  Created by Field Employee on 4/6/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

import Foundation

class Challenges {
    
    func challenge2_1(myarr: [Int]) -> [Int] {
        let sortedArr = myarr.sorted()
        var tupleArr: [(Int, Int)] = []
        
        var currVal = myarr[0]
        var currCount = 0
        for i in 0..<sortedArr.count {
          if sortedArr[i] == currVal {
            currCount += 1
          } else {
            tupleArr.append((currVal, currCount))
            currVal = sortedArr[i]
            currCount = 1
          }
        }
        tupleArr.append((currVal, currCount))
        
        tupleArr.sort(by: { $0.0 < $1.0 })
        tupleArr.sort(by: { $0.1 < $1.1 })
        
        
        var retArr: [Int] = []
        for item in tupleArr {
          var count = item.1
          while count >= 1 {
            retArr.append(item.0)
            count -= 1
          }
        }
        return retArr
    }
    
    func challenge2_2(in arr: [Int]) -> Int? {
        if arr.count <= 1 {
          return nil
        }
        
        var largest: Int = arr[0]
        var second: Int = arr[1]
        
        if (second > largest) {
          let temp = largest
          largest = second
          second = temp
        }
        if (arr.count == 2) {
          return second
        } else {
          for item in arr[2..<arr.count] {
            if (item > largest) {
              second = largest
              largest = item
            } else if (item > second) {
              second = item
            }
          }
        }
        return second
    }
    
    func challenge3_1(_ arr: [Int], _ summation: Int) -> Int {
          
        var countDict: [Int: Int] = [:]
        
        var max: Int = summation
        
        for item in arr {
          if countDict[item] == nil {
            countDict[item] = 1
          } else {
            countDict[item]! += 1
          }
        }
        
        var retVal = 0
        
        if summation % 2 == 0 {
          if let numIndex = countDict[summation/2] {
            retVal += (numIndex * (numIndex - 1))/2
          }
        }
        
        for index in 0..<summation/2 {
          if let numIndex1 = countDict[index] {
            if let numIndex2 = countDict[summation - index] {
              retVal += (numIndex1 * numIndex2)
            }
          }
        }
        
        return retVal
    }
    
    let langFormatter: [String: String] = ["en_US":"at %@ o'clock", "es": "a la%@"]
    
    func challenge4_1(_ arr: String) -> String  {
        var res = ""
        var counter: [String: Int] = [:]
        
        let separated = arr.split(separator: " ")
        
        for word in separated {
            if counter[String(word)] == nil {
                counter[String(word)] = 1
                continue
            }
            
            counter[String(word)]! += 1
        }
        
        var prev = 0
        
        for count in counter.keys {
            if counter[count]! > prev {
                prev = counter[count]!
                res = count
            }
        }
        
        return res
    }
    
    func challenge4_2(atLocale locale: String, hour optionalTime: Int? = nil) -> String  {
        let formatToUse = langFormatter[locale]!
        
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: locale)
        formatter.dateFormat = "H"
        
        let hour = optionalTime ?? Int(formatter.string(from: Date()))
        
        let nbrFormatter = NumberFormatter()

        nbrFormatter.numberStyle = .spellOut
        nbrFormatter.locale = Locale(identifier: locale)
        
        var translatedNbr = nbrFormatter.string(from: hour! as NSNumber)
        
        if locale == "es" {
            if translatedNbr == "uno" {
                translatedNbr = " una"
            } else {
                translatedNbr = "s \(translatedNbr!)"
            }
        }
        
        return String(format: formatToUse, translatedNbr!)
    }
    
    func challenge5_2(in str: String) -> Int {
        var count: Int = 0
        for char in str {
            if char == "a" || char == "A" {
                count += 1
            }
        }
        
        return count
    }
}

extension String {
  func camelCase() -> String {
    var skipped: Bool = false
    var retString = ""
    
    retString.append(self[self.index(startIndex, offsetBy: 0)].lowercased())
    
    for index in 1..<self.count {
      if (self[self.index(self.startIndex, offsetBy: index)] == " ") {
        skipped = true
        continue
      } else {
        let nextChar = self[self.index(self.startIndex, offsetBy: index)]
        if (skipped) {
          skipped = false
          retString.append(nextChar.uppercased())
        } else {
          retString.append(self[self.index(self.startIndex, offsetBy: index)])
        }
      }
    }
    return retString
  }
}
