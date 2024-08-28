//
//  BinarySearchTree.swift
//  AlgorithmsAndDataStructure
//
//  Created by MacPro on 28/08/24.
//

import Foundation

final class BinarySearchTree<T: Equatable> {
    private(set) var root: BSTNode<T>?
    
    func insert(_ value: T) {
        root = BSTNode(value: value)
    }
}
