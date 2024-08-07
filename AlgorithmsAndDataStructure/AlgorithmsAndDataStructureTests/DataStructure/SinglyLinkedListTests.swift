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
}

final class SinglyLinkedList<T: Equatable> {
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
        return nil
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
}
