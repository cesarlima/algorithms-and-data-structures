//
//  SinglyLinkedList.swift
//  AlgorithmsAndDataStructure
//
//  Created by MacPro on 17/08/24.
//

import Foundation

final class SinglyLinkedList<T: Equatable>: Equatable {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    private(set) var count: Int
    
    init() {
        self.head = nil
        self.tail = nil
        self.count = 0
    }
    
    func push(_ element: Node<T>) {
        if count == 0 {
            head = element
            tail = element
        } else {
            tail?.setNext(element)
            tail = element
        }
        
        count += 1
    }
    
    func pop() -> Node<T>? {
        guard count > 0 else { return nil }
        var current = head
        var previus = current
        
        while current?.next != nil {
            previus = current
            current = current?.next
        }
        
        previus?.setNext(nil)
        tail = previus
        count -= 1
        
        if count == 0 {
            head = nil
            tail = nil
        }

        return current
    }
    
    func shift() -> Node<T>? {
        guard count > 0 else { return nil }
        let result = head
        head = head?.next
        count -= 1
        
        if count == 0 {
            tail = nil
        }
        
        return result
    }
    
    @discardableResult
    func unshift(_ value: T) -> SinglyLinkedList<T> {
        let newNode = Node(value: value)
        if count == 0 {
            head = newNode
            tail = newNode
        } else {
            newNode.setNext(head)
            head = newNode
        }
        
        count += 1
        
        return self
    }
    
    func get(_ index: Int) -> Node<T>? {
        guard count > 0,
              index > -1,
              index < count else {
            return nil
        }
        
        var result = head
        var count = 0
        
        while count < index {
            result = result?.next
            count += 1
        }
        
        return result
    }
    
    func set(_ value: T, at index: Int) -> Bool {
        guard let node = get(index) else {
            return false
        }
        
        node.setValue(value)
        return true
    }
    
    @discardableResult
    func insert(_ value: T, at index: Int) -> Bool {
        guard index > -1,
              index <= count else {
            return false
        }
        
        if index == 0 {
            unshift(value)
        } else if index == count {
            push(Node(value: value))
        } else {
            let node = get(index - 1)
            let newNode = Node(value: value)
            newNode.setNext(node?.next)
            node?.setNext(newNode)
            count += 1
        }
        
        return true
    }
    
    func remove(at index: Int) -> Node<T>? {
        guard index > -1,
              index < count else {
            return nil
        }
        
        if index == 0 {
            return shift()
        } else if (index + 1) == count {
            return pop()
        }
        
        let previusNode = get(index - 1)
        let toRemove = previusNode?.next
        previusNode?.setNext(toRemove?.next)
        count -= 1
        return toRemove
    }
    
    func reverse() {

        func swap(_ newNext: Node<T>?) {
            guard newNext?.next != nil else { return }
            swap(newNext?.next)
            newNext?.next?.setNext(newNext)
        }
        
        swap(head)
        let newHead = tail
        tail = head
        head = newHead
        tail?.setNext(nil)
    }
    
    static func == (lhs: SinglyLinkedList<T>, rhs: SinglyLinkedList<T>) -> Bool {
        return lhs.head == rhs.head
        && lhs.tail == rhs.tail
        && lhs.count == rhs.count
    }
}
