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
        
        guard values.count > 1 else {
            return values.removeLast()
        }
       
        let result = values[0]
        values[0] = values.removeLast()
        sinkDown(from: 0)
        
        return result
    }
    
    private func sinkDown(from index: Int) {
        var index = index
        var largestIndex = index
        let totalElements = values.count
        
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = index * 2 + 2
            
            if leftChildIndex < totalElements 
                && values[leftChildIndex] > values[largestIndex] {
                largestIndex = leftChildIndex
            }
            
            if rightChildIndex < totalElements
                && values[rightChildIndex] > values[largestIndex] {
                largestIndex = rightChildIndex
            }
            
            if largestIndex == index {
                break
            }
            
            values.swapAt(index, largestIndex)
            index = largestIndex
        }
    }
}
