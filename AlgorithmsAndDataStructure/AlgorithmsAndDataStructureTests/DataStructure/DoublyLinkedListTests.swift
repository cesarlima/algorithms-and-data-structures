//
//  DoublyLinkedListTests.swift
//  AlgorithmsAndDataStructureTests
//
//  Created by MacPro on 17/08/24.
//

import XCTest
@testable import AlgorithmsAndDataStructure

final class DoublyLinkedListTests: XCTestCase {
    
    func test_init_createsAnEmptyList() {
        let sut = DoublyLinkedList<Int>()
        
        XCTAssertEqual(sut.count, 0)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_push_addsNodeAsHeadAndTailAndIncrementsCountOnEmptyList() {
        let sut = DoublyLinkedList<Int>()
        let value = 1
        
        sut.push(value)
        
        XCTAssertEqual(sut.head?.value, value)
        XCTAssertEqual(sut.tail?.value, value)
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_push_addsNodeToEndOfNonEmptyListAndIncrementsCount() {
        let sut = DoublyLinkedList<Int>()
        let expectedFirstValue = 1
        let expectedSecondValue = 2
        let expectedThirdValue = 3
        
        sut.push(expectedFirstValue)
        sut.push(expectedSecondValue)
        sut.push(expectedThirdValue)
        
        XCTAssertEqual(sut.head?.value, expectedFirstValue)
        XCTAssertEqual(sut.head?.next?.value, expectedSecondValue)
        XCTAssertEqual(sut.tail?.value, expectedThirdValue)
        XCTAssertEqual(sut.tail?.prev?.value, expectedSecondValue)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_pop_hasNoSideEffectsOnEmptyList() {
        let sut = DoublyLinkedList<Int>()
        
        sut.pop()
        
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_pop_removesTheLastNodeAndDecrementsCount() {
        let sut = DoublyLinkedList<Int>()
        let expectedFirstValue = 1
        let expectedSecondValue = 2
        let expectedThirdValue = 3
        sut.push(expectedFirstValue)
        sut.push(expectedSecondValue)
        sut.push(expectedThirdValue)
        
        let removedNode = sut.pop()
        
        XCTAssertEqual(sut.head?.value, expectedFirstValue)
        XCTAssertEqual(sut.head?.next?.value, expectedSecondValue)
        XCTAssertEqual(sut.tail?.value, expectedSecondValue)
        XCTAssertEqual(sut.tail?.prev?.value, expectedFirstValue)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 2)
        XCTAssertEqual(removedNode?.value, expectedThirdValue)
        XCTAssertNil(removedNode?.prev)
        XCTAssertNil(removedNode?.next)
    }
    
    func test_pop_removesHeadAndTailInListWithOneElement() {
        let sut = DoublyLinkedList<Int>()
        let expectedFirstValue = 1
        sut.push(expectedFirstValue)
        
        let removedNode = sut.pop()
        
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(removedNode?.value, expectedFirstValue)
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_shift_hasNoSideEffectsOnEmptyList() {
        let sut = DoublyLinkedList<Int>()
        
        sut.shift()
        
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_shift_removesHeadAndTailInListWithOneElement() {
        let sut = DoublyLinkedList<Int>()
        let expectedFirstValue = 1
        sut.push(expectedFirstValue)
        
        let removedNode = sut.shift()
        
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(removedNode?.value, expectedFirstValue)
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_shift_removesTheFirstNodeAndDecrementsCount() {
        let sut = DoublyLinkedList<Int>()
        let expectedFirstValue = 1
        let expectedSecondValue = 2
        let expectedThirdValue = 3
        sut.push(expectedFirstValue)
        sut.push(expectedSecondValue)
        sut.push(expectedThirdValue)
        
        let removedNode = sut.shift()
        
        XCTAssertEqual(sut.head?.value, expectedSecondValue)
        XCTAssertEqual(sut.head?.next?.value, expectedThirdValue)
        XCTAssertNil(sut.head?.prev)
        XCTAssertEqual(sut.tail?.value, expectedThirdValue)
        XCTAssertEqual(sut.tail?.prev?.value, expectedSecondValue)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 2)
        XCTAssertEqual(removedNode?.value, expectedFirstValue)
        XCTAssertNil(removedNode?.prev)
        XCTAssertNil(removedNode?.next)
    }
    
    func test_shift_removesFirstElementAndSetsHeadAndTailToSameNode() {
        let sut = DoublyLinkedList<Int>()
        let expectedFirstValue = 1
        let expectedSecondValue = 2
        sut.push(expectedFirstValue)
        sut.push(expectedSecondValue)
        
        let removedNode = sut.shift()
        
        XCTAssertEqual(sut.head?.value, expectedSecondValue)
        XCTAssertNil(sut.head?.next)
        XCTAssertNil(sut.head?.prev)
        XCTAssertNil(sut.tail?.prev)
        XCTAssertEqual(sut.tail?.value, expectedSecondValue)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 1)
        XCTAssertEqual(removedNode?.value, expectedFirstValue)
        XCTAssertNil(removedNode?.prev)
        XCTAssertNil(removedNode?.next)
    }
    
    func test_unshift_addsNodeAsHeadAndTailAndIncrementsCountOnEmptyList() {
        let sut = DoublyLinkedList<Int>()
        let value = 1
        
        sut.unshift(value)
        
        XCTAssertEqual(sut.head?.value, value)
        XCTAssertEqual(sut.tail?.value, value)
        XCTAssertNil(sut.head?.next)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_unshift_addsNodeToBeginningOfNonEmptyList() {
        let sut = DoublyLinkedList<Int>()
        let expectedFirstValue = 5
        let expectedSecondValue = 22
        let expectedThirdValue = 30
        sut.push(expectedSecondValue)
        sut.push(expectedThirdValue)
        
        sut.unshift(expectedFirstValue)
        
        XCTAssertEqual(sut.head?.value, expectedFirstValue)
        XCTAssertEqual(sut.head?.next?.value, expectedSecondValue)
        XCTAssertNil(sut.head?.prev)
        XCTAssertEqual(sut.tail?.value, expectedThirdValue)
        XCTAssertEqual(sut.tail?.prev?.prev?.value, expectedFirstValue)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_get_returnsNilAndHasNoSideEffectsOnEmptyList() {
        let sut = DoublyLinkedList<Int>()
       
        let result = sut.get(at: 0)
        
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertNil(result)
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_get_returnsNilForInvalidIndex() {
        let sut = DoublyLinkedList<Int>()
        sut.push(1)
        sut.push(2)
        
        XCTAssertNil(sut.get(at: 3))
        XCTAssertNil(sut.get(at: -1))
    }
    
    func test_get_returnsNodeForValidIndex() {
        let sut = DoublyLinkedList<Int>()
        let nodesQuantity = 100
        for num in 1...nodesQuantity {
            sut.push(num)
        }
        
        XCTAssertEqual(sut.get(at: 90)?.value, 91)
        XCTAssertEqual(sut.get(at: 3)?.value, 4)
        XCTAssertEqual(sut.get(at: 50)?.value, 51)
        XCTAssertEqual(sut.count, nodesQuantity)
    }
    
    func test_set_returnsFalseOnEmptyList() {
        let sut = DoublyLinkedList<Int>()
        
        XCTAssertFalse(sut.set(5, at: 0))
    }
    
    func test_set_returnsFalseOnInvalidIndex() {
        let sut = DoublyLinkedList<Int>()
        sut.push(1)
        sut.push(2)
        
        XCTAssertFalse(sut.set(5, at: -1))
        XCTAssertFalse(sut.set(3, at: 3))
    }
    
    func test_set_returnsTrueAndChangesValueOnValidIndex() {
        let sut = DoublyLinkedList<Int>()
        let valueToSet = 5
        let indexToSet = 1
        sut.push(1)
        sut.push(2)
        sut.push(3)
        
        XCTAssertTrue(sut.set(valueToSet, at: indexToSet))
        XCTAssertEqual(sut.get(at: indexToSet)?.value, valueToSet)
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_insert_returnsFalseAndHasNoSideEffectsOnInvalidIndex() {
        let sut = DoublyLinkedList<Int>()
        
        XCTAssertFalse(sut.insert(3, at: -1))
        XCTAssertFalse(sut.insert(3, at: 1))
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_insert_insertsAtBeginningIncrementsCountAndReturnsTrue() {
        let sut = DoublyLinkedList<Int>()
        let expectedFirstValue = 5
        let expectedSecondValue = 10
        sut.push(expectedSecondValue)
        
        let result = sut.insert(expectedFirstValue, at: 0)
        
        XCTAssertTrue(result)
        XCTAssertEqual(sut.head?.value, expectedFirstValue)
        XCTAssertEqual(sut.head?.next?.value, expectedSecondValue)
        XCTAssertNil(sut.head?.prev)
        XCTAssertEqual(sut.tail?.value, expectedSecondValue)
        XCTAssertEqual(sut.tail?.prev?.value, expectedFirstValue)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_insert_insertsAtEndIncrementsCountAndReturnsTrue() {
        let sut = DoublyLinkedList<Int>()
        let expectedFirstValue = 5
        let expectedSecondValue = 10
        let expectedThirdValue = 12
        sut.push(expectedFirstValue)
        sut.push(expectedSecondValue)
        
        let result = sut.insert(expectedThirdValue, at: 2)
        
        XCTAssertTrue(result)
        XCTAssertEqual(sut.head?.value, expectedFirstValue)
        XCTAssertEqual(sut.head?.next?.value, expectedSecondValue)
        XCTAssertNil(sut.head?.prev)
        XCTAssertEqual(sut.tail?.value, expectedThirdValue)
        XCTAssertEqual(sut.tail?.prev?.value, expectedSecondValue)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_insert_insertsAtValidIndexIncrementsCountAndReturnsTrue() {
        let sut = DoublyLinkedList<Int>()
        let expectedFirstValue = 5
        let expectedSecondValue = 10
        let expectedThirdValue = 12
        sut.push(expectedFirstValue)
        sut.push(expectedThirdValue)
        
        let result = sut.insert(expectedSecondValue, at: 1)
        
        XCTAssertTrue(result)
        XCTAssertEqual(sut.head?.value, expectedFirstValue)
        XCTAssertEqual(sut.head?.next?.value, expectedSecondValue)
        XCTAssertNil(sut.head?.prev)
        XCTAssertEqual(sut.tail?.value, expectedThirdValue)
        XCTAssertEqual(sut.tail?.prev?.value, expectedSecondValue)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_remove_returnsNilOnInvalidIndexAndHasNoSideEffects() {
        let sut = DoublyLinkedList<Int>()
        
        XCTAssertNil(sut.remove(at: -1))
        XCTAssertNil(sut.remove(at: 1))
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_remove_removesFromTheBeginningDecrementsCountAndReturnsRemovedNode() {
        let sut = DoublyLinkedList<Int>()
        let expectedFirstValue = 5
        let expectedSecondValue = 10
        let expectedThirdValue = 12
        sut.push(expectedFirstValue)
        sut.push(expectedSecondValue)
        sut.push(expectedThirdValue)
        
        let resutl = sut.remove(at: 0)
        
        XCTAssertEqual(resutl?.value, expectedFirstValue)
        XCTAssertNil(resutl?.prev)
        XCTAssertNil(resutl?.next)
        XCTAssertEqual(sut.head?.value, expectedSecondValue)
        XCTAssertEqual(sut.head?.next?.value, expectedThirdValue)
        XCTAssertNil(sut.head?.prev)
        XCTAssertEqual(sut.tail?.value, expectedThirdValue)
        XCTAssertEqual(sut.tail?.prev?.value, expectedSecondValue)
        XCTAssertNil(sut.tail?.next)
        XCTAssertEqual(sut.count, 2)
    }
}
