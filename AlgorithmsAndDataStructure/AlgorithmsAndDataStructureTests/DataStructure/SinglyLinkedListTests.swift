//
//  SinglyLinkedListTests.swift
//  AlgorithmsAndDataStructureTests
//
//  Created by MacPro on 06/08/24.
//

import XCTest

final class Node<T: Equatable>: Equatable {
    private(set) var value: T
    private(set) var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
        && lhs.next?.value == rhs.next?.value
    }
    
    func setNext(_ element: Node<T>?) {
        next = element
    }
    
    func setValue(_ value: T) {
        self.value = value
    }
}

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
        guard var node = get(index) else {
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
        }
        
        return true
    }
    
    static func == (lhs: SinglyLinkedList<T>, rhs: SinglyLinkedList<T>) -> Bool {
        return lhs.head == rhs.head
        && lhs.tail == rhs.tail
        && lhs.count == rhs.count
    }
}

final class SinglyLinkedListTests: XCTestCase {
        
    func test_init_allPropertiesAreEmpty() {
        let sut = SinglyLinkedList<Int>()
        
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_push_setsHeadTailAndIncrementsCountOnEmptyList() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        
        sut.push(node)
        
        XCTAssertEqual(sut.head, node)
        XCTAssertEqual(sut.tail, node)
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_push_setsElementAsTailAndUpdatesHeadNextOnNonEmptyList() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        
        sut.push(node)
        sut.push(node2)
        sut.push(node3)
        
        XCTAssertEqual(sut.head, node)
        XCTAssertEqual(sut.head!.next, node2)
        XCTAssertEqual(sut.head!.next!.next, node3)
        XCTAssertEqual(sut.tail, node3)
        XCTAssertNil(sut.tail!.next)
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_pop_returnsNilOnEmptyList() {
        let sut = SinglyLinkedList<Int>()
  
        let result = sut.pop()
        
        XCTAssertNil(result)
    }
    
    func test_pop_removesHeadTailAndDecreasesCountOnSingleElementList() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        sut.push(node)
 
        let result = sut.pop()
        
        XCTAssertEqual(result, node)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_pop_removesLastElementAndUpdatesTail() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        sut.push(node)
        sut.push(node2)
        sut.push(node3)
 
        let deletedElement = sut.pop()
        
        XCTAssertEqual(deletedElement, node3)
        XCTAssertEqual(sut.head, node)
        XCTAssertEqual(sut.tail, node2)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_pop_removesLastElementAndUpdatesHeadAndTailOnAListWithTwoElements() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        sut.push(node)
        sut.push(node2)
 
        let deletedElement = sut.pop()
        
        XCTAssertEqual(deletedElement, node2)
        XCTAssertEqual(sut.head, node)
        XCTAssertEqual(sut.tail, node)
        XCTAssertNil(sut.head?.next)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_shift_returnsNilOnEmptyList() {
        let sut = SinglyLinkedList<Int>()
        
        let result = sut.shift()
        
        XCTAssertNil(result)
    }
    
    func test_shift_removesHeadAndTailOnAListWithOneElement() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        sut.push(node)
        
        let removedElement = sut.shift()
        
        XCTAssertEqual(removedElement, node)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_shift_removesFirstElementAndUpdatesHeadAndTailOnAListWithTwoElements() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        sut.push(node)
        sut.push(node2)
        
        let removedElement = sut.shift()
        
        XCTAssertEqual(removedElement, node)
        XCTAssertEqual(sut.head, node2)
        XCTAssertEqual(sut.tail, node2)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_shift_removesFirstElementAndUpdatesHead() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        sut.push(node)
        sut.push(node2)
        sut.push(node3)
        
        let removedElement = sut.shift()
        
        XCTAssertEqual(removedElement, node)
        XCTAssertEqual(sut.head, node2)
        XCTAssertEqual(sut.tail, node3)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_unshift_setsElementAsHeadTailAndIncrementsCountInEmptyList() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        
        sut.unshift(node.value)
        
        XCTAssertEqual(sut.head, node)
        XCTAssertEqual(sut.tail, node)
        XCTAssertNil(sut.head?.next)
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_unshift_setsElementAsNewHeadAndIncrementsCountInNonEmptyList() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        
        sut.unshift(node.value)
        sut.unshift(node2.value)
        let result = sut.unshift(node3.value)
        
        XCTAssertEqual(sut.head?.value, node3.value)
        XCTAssertEqual(sut.tail, node)
        XCTAssertEqual(sut.head?.next?.value, node2.value)
        XCTAssertEqual(sut.count, 3)
        XCTAssertEqual(result, sut)
    }
    
    func test_get_returnsNilOnAnEmptyList() {
        let sut = SinglyLinkedList<Int>()
       
        let result = sut.get(0)
        
        XCTAssertNil(result)
    }
    
    func test_get_returnsNilOnAnInvalidIndex() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        sut.unshift(node.value)
       
        let result = sut.get(3)
        
        XCTAssertNil(result)
    }
    
    func test_get_returnsNodeForReceivedIndex() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        sut.push(node)
        sut.push(node2)
        sut.push(node3)
        
        XCTAssertEqual(sut.get(2)?.value, node3.value)
        XCTAssertEqual(sut.get(0)?.value, node.value)
        XCTAssertEqual(sut.get(1)?.value, node2.value)
    }
    
    func test_set_returnsFalseOnAnEmptyList() {
        let sut = SinglyLinkedList<Int>()
        
        let result = sut.set(100, at: 1)
        
        XCTAssertFalse(result)
    }
    
    func test_set_returnsFalseOnAnInvalidIndex() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        sut.push(node)
        
        let result = sut.set(100, at: 4)
        
        XCTAssertFalse(result)
    }
    
    func test_set_updatesNodeValueAtReceivedIndexAndReturnsTrue() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        sut.push(node)
        sut.push(node2)
        sut.push(node3)
        
        XCTAssertTrue(sut.set(30, at: 1))
        XCTAssertEqual(sut.get(1)?.value, 30)
        XCTAssertTrue(sut.set(9, at: 2))
        XCTAssertEqual(sut.get(2)?.value, 9)
    }
    
    func test_insert_returnsFalseOnInvalidIndex() {
        let sut = SinglyLinkedList<Int>()
        
        XCTAssertFalse(sut.insert(5, at: -1))
    }
    
    func test_insert_insertsAtTheBeginning() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let valueToInsert = 9
        sut.push(node)
        
        sut.insert(valueToInsert, at: 0)
        
        XCTAssertEqual(sut.head?.value, valueToInsert)
        XCTAssertEqual(sut.head?.next?.value, node.value)
        XCTAssertEqual(sut.tail?.value, node.value)
        XCTAssertEqual(sut.count, 2)
    }
}
