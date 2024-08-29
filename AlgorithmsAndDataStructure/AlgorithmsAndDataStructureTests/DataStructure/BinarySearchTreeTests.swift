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
}
