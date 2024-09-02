//
//  BinarySearchTree.swift
//  AlgorithmsAndDataStructure
//
//  Created by MacPro on 28/08/24.
//

import Foundation

final class BinarySearchTree<T: Comparable> {
    private(set) var root: BSTNode<T>?
    
    func insert(_ value: T) {
        let newNode = BSTNode(value: value)
        
        guard var parent = root else {
            root = newNode
            return
        }
        
        while true {
            guard newNode.value != parent.value else {
                return
            }
            
            if newNode.value > parent.value {
                if parent.right == nil {
                    parent.setRight(newNode)
                    break
                }
                
                parent = parent.right!
            } else {
                if parent.left == nil {
                    parent.setLeft(newNode)
                    break
                }
                
                parent = parent.left!
            }
        }
    }
}
