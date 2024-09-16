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
    
    func extractMax() -> T? {
        guard !values.isEmpty else {
            return nil
        }
        
        var elementIndex = 0
        let lastIndex = values.count - 1
        values.swapAt(elementIndex, lastIndex)
        let element = values[elementIndex]
        let result = values.removeLast()
        let totalElements = values.count
        
        while true {
            let leftChildIndex = elementIndex * 2 + 1
            let rightChildIndex = elementIndex * 2 + 2
            guard totalElements > leftChildIndex,
                  totalElements >= rightChildIndex else {
                return result
            }
            
            let leftChildValue = values[leftChildIndex]
            let righChildValue = values[rightChildIndex]
            
            if element < leftChildValue
                && leftChildValue > righChildValue {
                values.swapAt(elementIndex, leftChildIndex)
                elementIndex = leftChildIndex
            } else if element < righChildValue {
                values.swapAt(elementIndex, rightChildIndex)
                elementIndex = rightChildIndex
            } else {
                break
            }
        }
        
        return result
    }
}
