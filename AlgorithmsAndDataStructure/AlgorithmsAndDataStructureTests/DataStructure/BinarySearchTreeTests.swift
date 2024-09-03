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
        let bst = BinarySearchTree<Int>()
        bst.insert(10)
        bst.insert(5)

        XCTAssertEqual(bst.root?.value, 10)
        XCTAssertEqual(bst.root?.left?.value, 5)
        XCTAssertNil(bst.root?.right)
    }
    
    func testInsertMultipleNodes() {
        let bst = BinarySearchTree<Int>()
        bst.insert(10)
        bst.insert(5)
        bst.insert(15)
        bst.insert(3)
        bst.insert(7)
        bst.insert(12)
        bst.insert(20)

        XCTAssertEqual(bst.root?.value, 10)
        XCTAssertEqual(bst.root?.left?.value, 5)
        XCTAssertEqual(bst.root?.right?.value, 15)
        XCTAssertEqual(bst.root?.left?.left?.value, 3)
        XCTAssertEqual(bst.root?.left?.right?.value, 7)
        XCTAssertEqual(bst.root?.right?.left?.value, 12)
        XCTAssertEqual(bst.root?.right?.right?.value, 20)
    }
    
    func testInsertDuplicateValue() {
        let bst = BinarySearchTree<Int>()
        bst.insert(10)
        bst.insert(5)
        bst.insert(10)

        XCTAssertEqual(bst.root?.value, 10)
        XCTAssertEqual(bst.root?.left?.value, 5)
        XCTAssertNil(bst.root?.right)
    }
    
    func test_find_returnsFalseOnEmptyTree() {
        let emptyBST = BinarySearchTree<Int>()
        XCTAssertFalse(emptyBST.find(1))
    }
}
