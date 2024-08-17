//
//  DoublyLinkedListTests.swift
//  AlgorithmsAndDataStructureTests
//
//  Created by MacPro on 17/08/24.
//

import XCTest
@testable import AlgorithmsAndDataStructure

final class DoublyLinkedListTests: XCTestCase {
    
    func test_init_createsAnEmptyList() {
        let sut = DoublyLinkedList<Int>()
        
        XCTAssertEqual(sut.count, 0)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_push_addsNodeAsHeadAndTailAndIncrementsCountOnEmptyList() {
        let sut = DoublyLinkedList<Int>()
        let value = 1
        
        sut.push(value)
        
        XCTAssertEqual(sut.head?.value, value)
        XCTAssertEqual(sut.tail?.value, value)
        XCTAssertEqual(sut.count, 1)
    }
}
