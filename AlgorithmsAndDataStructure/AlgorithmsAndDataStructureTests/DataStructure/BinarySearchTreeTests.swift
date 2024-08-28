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
}
