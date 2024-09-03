//
//  BinarySearchTreeTests.swift
//  AlgorithmsAndDataStructureTests
//
//  Created by MacPro on 28/08/24.
//

import XCTest
@testable import AlgorithmsAndDataStructure

final class BinarySearchTreeTests: XCTestCase {

    func test_init_createsAnEmptyBST() {
        let sut = BinarySearchTree<Int>()
        
        XCTAssertNil(sut.root)
    }
    
    func test_insert_insertsRootInAnEmptyBST() {
        let sut = BinarySearchTree<Int>()
        let valueToInsert = 50
        
        sut.insert(valueToInsert)
        
        XCTAssertEqual(sut.root?.value, valueToInsert)
    }
    
    func test_insert_insertsValueOnRightWhenRightIsEmpty() {
        let sut = BinarySearchTree<Int>()
        let rootValue = 50
        let rightValue = 55
        
        sut.insert(rootValue)
        sut.insert(rightValue)
        
        XCTAssertEqual(sut.root?.value, rootValue)
        XCTAssertEqual(sut.root?.right?.value, rightValue)
    }
    
    func testInsertLeftChild() {
        let sut = BinarySearchTree<Int>()
        sut.insert(10)
        sut.insert(5)

        XCTAssertEqual(sut.root?.value, 10)
        XCTAssertEqual(sut.root?.left?.value, 5)
        XCTAssertNil(sut.root?.right)
    }
    
    func testInsertMultipleNodes() {
        let sut = BinarySearchTree<Int>()
        sut.insert(10)
        sut.insert(5)
        sut.insert(15)
        sut.insert(3)
        sut.insert(7)
        sut.insert(12)
        sut.insert(20)

        XCTAssertEqual(sut.root?.value, 10)
        XCTAssertEqual(sut.root?.left?.value, 5)
        XCTAssertEqual(sut.root?.right?.value, 15)
        XCTAssertEqual(sut.root?.left?.left?.value, 3)
        XCTAssertEqual(sut.root?.left?.right?.value, 7)
        XCTAssertEqual(sut.root?.right?.left?.value, 12)
        XCTAssertEqual(sut.root?.right?.right?.value, 20)
    }
    
    func testInsertDuplicateValue() {
        let sut = BinarySearchTree<Int>()
        sut.insert(10)
        sut.insert(5)
        sut.insert(10)

        XCTAssertEqual(sut.root?.value, 10)
        XCTAssertEqual(sut.root?.left?.value, 5)
        XCTAssertNil(sut.root?.right)
    }
    
    func test_find_returnsFalseOnEmptyTree() {
        let sut = BinarySearchTree<Int>()
        XCTAssertFalse(sut.find(1))
    }
    
    func test_find_returnsTrueForExistingValue() {
        let sut = BinarySearchTree<Int>()
        [8, 3, 10, 1, 6, 14, 4, 7, 13].forEach { sut.insert($0) }
        
        XCTAssertTrue(sut.find(8))
        XCTAssertTrue(sut.find(3))
        XCTAssertTrue(sut.find(10))
        XCTAssertTrue(sut.find(1))
        XCTAssertTrue(sut.find(6))
        XCTAssertTrue(sut.find(14))
        XCTAssertTrue(sut.find(4))
        XCTAssertTrue(sut.find(7))
        XCTAssertTrue(sut.find(13))
    }
}
