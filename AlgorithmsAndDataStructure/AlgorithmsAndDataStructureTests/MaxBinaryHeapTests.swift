//
//  MaxBinaryHeapTests.swift
//  AlgorithmsAndDataStructureTests
//
//  Created by MacPro on 09/09/24.
//

import XCTest
@testable import AlgorithmsAndDataStructure

final class MaxBinaryHeapTests: XCTestCase {

    func test_init_createsAnEmptyMaxBinaryHeap() {
        let sut = MaxBinaryHeap<Int>()
        
        XCTAssertTrue(sut.values.isEmpty)
    }
    
    func test_insert_addsElementToEmptyHeap() {
        let sut = MaxBinaryHeap<Int>()
        
        sut.insert(1)
        
        XCTAssertEqual(sut.values.count, 1)
        XCTAssertEqual(sut.values.first, 1)
    }
}
