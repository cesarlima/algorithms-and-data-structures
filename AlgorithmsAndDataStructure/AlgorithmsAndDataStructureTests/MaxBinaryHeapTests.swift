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
}
