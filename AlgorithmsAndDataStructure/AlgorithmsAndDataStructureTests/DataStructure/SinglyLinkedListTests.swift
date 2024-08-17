//
//  SinglyLinkedListTests.swift
//  AlgorithmsAndDataStructureTests
//
//  Created by MacPro on 06/08/24.
//

import XCTest
@testable import AlgorithmsAndDataStructure

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
    
    func test_insert_insertsAtTheEnd() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        sut.push(node)
        sut.push(node2)
        let valueToInsert = 9
        
        sut.insert(valueToInsert, at: 2)
        
        XCTAssertEqual(sut.head?.value, node.value)
        XCTAssertEqual(sut.tail?.value, valueToInsert)
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_insert_insertsBetweenNodes() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 2)
        sut.push(node)
        sut.push(node2)
        sut.push(node3)
        let valueToInsert = 9
        
        sut.insert(valueToInsert, at: 1)
        
        XCTAssertEqual(sut.head?.next?.value, valueToInsert)
        XCTAssertEqual(sut.count, 4)
    }
    
    func test_remove_doesNothingOnInvalidIndex() {
        let sut = SinglyLinkedList<Int>()
        
        XCTAssertNil(sut.remove(at: 0))
        XCTAssertEqual(sut.count, 0)
        
        sut.unshift(1)
        XCTAssertNil(sut.remove(at: 2))
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_remove_removesNodeFromBeginningAndDecrementsCount() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        sut.push(node)
        sut.push(node2)
        
        let result = sut.remove(at: 0)
        
        XCTAssertEqual(node.value, result?.value)
        XCTAssertEqual(sut.head?.value, node2.value)
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_remove_removesNodeFromEndAndDecrementsCount() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        sut.push(node)
        sut.push(node2)
        
        let result = sut.remove(at: 1)
        
        XCTAssertEqual(node2.value, result?.value)
        XCTAssertEqual(sut.head?.value, node.value)
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_remove_removesNodeBetweenNodes() {
        let sut = SinglyLinkedList<Int>()
        let node = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        sut.push(node)
        sut.push(node2)
        sut.push(node3)
        
        let result = sut.remove(at: 1)
        
        XCTAssertEqual(node2.value, result?.value)
        XCTAssertEqual(sut.head?.value, node.value)
        XCTAssertEqual(sut.tail?.value, node3.value)
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_reverse_reversesTheList() {
        let sut = SinglyLinkedList<Int>()
        let nodes = [
            Node(value: 13),
            Node(value: 27),
            Node(value: 32),
            Node(value: 71)
        ]
        nodes.forEach { sut.push($0) }
        
        sut.reverse()
        
        for (index, expectedNode) in nodes.reversed().enumerated() {
            XCTAssertEqual(expectedNode.value, sut.get(index)?.value)
            XCTAssertEqual(expectedNode.next?.value, sut.get(index)?.next?.value)
        }
        XCTAssertEqual(sut.head?.value, nodes[3].value)
        XCTAssertEqual(sut.tail?.value, nodes[0].value)
        XCTAssertNil(sut.tail?.next)
        
    }
}
