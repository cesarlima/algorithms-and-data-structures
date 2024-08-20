//
//  DoublyLinkedList.swift
//  AlgorithmsAndDataStructure
//
//  Created by MacPro on 17/08/24.
//

import Foundation

final class DoublyLinkedList<T: Equatable> {
    private(set) var head: DoublyNode<T>?
    private(set) var tail: DoublyNode<T>?
    private(set) var count = 0
    
    func push(_ value: T) {
        let node = DoublyNode(value: value)
        
        if count == 0 {
            head = node
        } else {
            tail?.setNext(node)
            node.setPrevious(tail)
        }
        
        tail = node
        count += 1
    }
    
    @discardableResult
    func pop() -> DoublyNode<T>? {
        guard count > 0 else { return nil }
        let result = tail
        tail = result?.prev
        tail?.setNext(nil)
        count -= 1
        result?.setPrevious(nil)
        
        if count == 0 {
            head = nil
        }
        
        return result
    }
    
    @discardableResult
    func shift() -> DoublyNode<T>? {
        guard count > 0 else { return nil }
        let result = head
        head = result?.next
        head?.setPrevious(nil)
        result?.setNext(nil)
        count -= 1
        
        if count == 0 {
            tail = nil
        }
        
        return result
    }
}
