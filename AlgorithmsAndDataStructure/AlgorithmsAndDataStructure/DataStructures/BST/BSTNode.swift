//
//  BSTNode.swift
//  AlgorithmsAndDataStructure
//
//  Created by MacPro on 28/08/24.
//

import Foundation

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
