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
        if root == nil {
            root = BSTNode(value: value)
        } else {
            root?.setRight(BSTNode(value: value))
        }
    }
}
