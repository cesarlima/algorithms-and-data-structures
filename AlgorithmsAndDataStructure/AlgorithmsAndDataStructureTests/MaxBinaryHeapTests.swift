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
    
    func test_insert_addsMultipleElementsInCorrectOrder() {
        let sut = MaxBinaryHeap<Int>()
        [10, 20, 25, 15, 30].forEach { sut.insert($0) }
        let expectedResult = [30, 25, 20, 10, 15]
        // Heap structure:
        //        30
        //       /  \
        //     25    20
        //    /  \
        //   10  15
        
        XCTAssertEqual(sut.values, expectedResult)
    }
    
    func test_extractMax_returnsNilOnEmptyHeap() {
        let sut = MaxBinaryHeap<Int>()
        
        let result = sut.extractMax()
        
        XCTAssertNil(result)
    }
}
