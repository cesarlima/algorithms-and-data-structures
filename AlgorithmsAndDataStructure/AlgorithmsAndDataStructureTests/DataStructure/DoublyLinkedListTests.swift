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
    
    func test_push_addsNodeToEndOfNonEmptyListAndIncrementsCount() {
        let sut = DoublyLinkedList<Int>()
        let expectedFirstValue = 1
        let expectedSecondValue = 2
        let expectedThirdValue = 3
        
        sut.push(expectedFirstValue)
        sut.push(expectedSecondValue)
        sut.push(expectedThirdValue)
        
        XCTAssertEqual(sut.head?.value, expectedFirstValue)
        XCTAssertEqual(sut.head?.next?.value, expectedSecondValue)
        XCTAssertEqual(sut.tail?.value, expectedThirdValue)
        XCTAssertEqual(sut.tail?.prev?.value, expectedSecondValue)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_pop_hasNoSideEffectsOnEmptyList() {
        let sut = DoublyLinkedList<Int>()
        
        sut.pop()
        
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(sut.count, 0)
    }
}