//
//  BinarySearchTreeTests.swift
//  AlgorithmsAndDataStructureTests
//
//  Created by MacPro on 28/08/24.
//

import XCTest

final class BSTNode<T: Equatable> {
    private(set) var value: T
    private(set) var left: BSTNode<T>?
    private(set) var right: BSTNode<T>?
    
    init(value: T) {
        self.value = value
    }
    
    func setRight(_ node: BSTNode<T>?) {
        self.right = node
    }
    
    func setLeft(_ node: BSTNode<T>?) {
        self.left = node
    }
}

final class BinarySearchTree<T: Equatable> {
    private(set) var root: BSTNode<T>?
}

final class BinarySearchTreeTests: XCTestCase {

    func test_init_createsAnEmptyBST() {
        let sut = BinarySearchTree<Int>()
        
        XCTAssertNil(sut.root)
    }
}
