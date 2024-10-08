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
    
    func unshift(_ value: T) {
        let newNode = DoublyNode(value: value)
        
        if count == 0 {
            tail = newNode
        } else {
            head?.setPrevious(newNode)
            newNode.setNext(head)
        }
        
        head = newNode
        count += 1
    }
    
    func get(at index: Int) -> DoublyNode<T>? {
        guard index > -1,
              index < count else {
            return nil
        }
        var result: DoublyNode<T>?
        
        if index < (count / 2) {
            result = head
            
            for _ in 0..<index {
                result = result?.next
            }
        } else {
            result = tail
            
            for _ in (index..<(count - 1)).reversed() {
                result = result?.prev
            }
        }
        
        return result
    }
    
    func set(_ value: T, at index: Int) -> Bool {
        guard let node = get(at: index) else {
            return false
        }
        
        node.setValue(value)
        return true
    }
    
    func insert(_ value: T, at index: Int) -> Bool {
        guard index > -1,
              index <= count else {
            return false
        }
        
        if index == 0 {
            unshift(value)
        } else if index == count {
            push(value)
        } else {
            let newNode = DoublyNode(value: value)
            let current = get(at: index)
            newNode.setPrevious(current?.prev)
            newNode.setNext(current)
            current?.prev?.setNext(newNode)
            current?.setPrevious(newNode)
            count += 1
        }
        
        return true
    }
    
    func remove(at index: Int) -> DoublyNode<T>? {
        guard index > -1,
              index < count else {
            return nil
        }
        
        if index == 0 {
            return shift()
        } else if index + 1 == count {
            return pop()
        }
        
        let result = get(at: index)
        let prev = result?.prev
        let next = result?.next
        prev?.setNext(next)
        next?.setPrevious(prev)
        result?.setNext(nil)
        result?.setPrevious(nil)
        count -= 1
        return result
    }
}
