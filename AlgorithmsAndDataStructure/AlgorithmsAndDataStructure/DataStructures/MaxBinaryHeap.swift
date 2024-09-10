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
    }
}
