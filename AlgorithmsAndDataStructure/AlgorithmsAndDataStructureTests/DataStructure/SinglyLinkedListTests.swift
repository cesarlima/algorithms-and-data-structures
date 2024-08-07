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
        head = element
        tail = element
        count += 1
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
}
