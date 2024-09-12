//
//  MaxBinaryHeap.swift
//  AlgorithmsAndDataStructure
//
//  Created by MacPro on 09/09/24.
//

import Foundation

final class MaxBinaryHeap<T: Comparable> {
    private(set) var values: [T]
    
    init() {
        values = []
    }
    
    func insert(_ value: T) {
        values.append(value)
        var childIndex = values.count - 1
        
        while childIndex > 0 {
            let parentIndex = (childIndex - 1) / 2
            
            guard values[childIndex] > values[parentIndex] else {
                return
            }
            
            values.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
        }
    }
}
