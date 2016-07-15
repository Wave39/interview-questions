//
//  Grid.swift
//  
//
//  Created by Brian Prescott on 7/15/16.
//
//

import UIKit

struct GridProgress {
    var indexArray:[Int] = []
    var totalCost:Int
}

class Grid: NSObject {

    var cellArray:[[Int]] = []
    var rowCount: Int = 0
    var columnCount: Int = 0
    var leastCost: GridProgress = GridProgress(indexArray: [], totalCost: Int.max)
    
    init(withString str:String) {
        let lines = str.componentsSeparatedByString("|")
        for line in lines {
            let numbers = line.componentsSeparatedByString(" ").map( { Int(String($0)) ?? 0 } )
            cellArray.append(numbers)
        }
        
        rowCount = cellArray.count
        columnCount = cellArray[0].count
    }
    
    func walkGrid() -> (String, Int, String) {
        for rowIndex in 0..<rowCount {
            let gp = GridProgress(indexArray: [rowIndex], totalCost: cellArray[rowIndex][0])
            appendProgress(gp)
        }
        
        let arrayString = leastCost.indexArray.map({"\($0 + 1)"}).joinWithSeparator(" ")
        return ((leastCost.indexArray.count == columnCount ? "Yes" : "No"), leastCost.totalCost, arrayString)
    }
    
    func appendProgress(gp: GridProgress) {
        let lastIndex = gp.indexArray.last!
        for newIndex in (lastIndex - 1)...(lastIndex + 1) {
            var adjustedIndex = newIndex
            if adjustedIndex < 0 {
                adjustedIndex = rowCount - 1
            } else if adjustedIndex >= rowCount {
                adjustedIndex = 0
            }
            
            var newGP = gp
            newGP.indexArray.append(adjustedIndex)
            newGP.totalCost += cellArray[adjustedIndex][(newGP.indexArray.count - 1)]
            if newGP.totalCost >= 50 {
                if gp.totalCost < leastCost.totalCost {
                    leastCost = gp
                }
            } else if newGP.indexArray.count == columnCount {
                if newGP.totalCost < leastCost.totalCost {
                    leastCost = newGP
                }
            } else {
                appendProgress(newGP)
            }
        }
    }
}
