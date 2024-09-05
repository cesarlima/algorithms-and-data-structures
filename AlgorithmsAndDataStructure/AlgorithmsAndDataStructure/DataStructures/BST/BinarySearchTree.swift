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
    
    func find(_ value: T) -> Bool {
        guard var current = root else {
            return false
        }
        
        if current.value == value {
            return true
        }
        
        while true {
            if value > current.value {
                if current.right == nil {
                    return false
                }
                
                current = current.right!
            } else if value < current.value {
                if current.left == nil {
                    return false
                }
                
                current = current.left!
            } else {
                return true
            }
        }
    }
    
    func bfs() -> [T] {
        guard var node = root else {
            return []
        }
        
        var result = [T]()
        var queue = [node]
        
        while !queue.isEmpty {
            node = queue.removeFirst()
            result.append(node.value)
            
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
        
        return result
    }
    
    func dfsPreOrder() -> [T] {
        guard let currentNode = root else {
            return []
        }
        var result = [T]()
        
        func traverse(_ node: BSTNode<T>) {
            result.append(node.value)
            
            if let left = node.left {
                traverse(left)
            }
            
            if let right = node.right {
                traverse(right)
            }
        }
        
        traverse(currentNode)
        
        return result
    }
    
    func dfsPostOrder() -> [T] {
        guard let current = root else {
            return []
        }
        var result = [T]()
        
        func traverse(_ node: BSTNode<T>) {
            if let left = node.left {
                traverse(left)
            }
            
            if let right = node.right {
                traverse(right)
            }
            
            result.append(node.value)
        }
        
        traverse(current)
        
        return result
    }
    
    func dfsInOrder() -> [T] {
        guard let current = root else {
            return []
        }
        var result = [T]()
        
        func traverse(_ node: BSTNode<T>) {
            if let left = node.left {
                traverse(left)
            }
            
            result.append(node.value)
            
            if let right = node.right {
                traverse(right)
            }
        }
        
        traverse(current)
        
        return result
    }
}
