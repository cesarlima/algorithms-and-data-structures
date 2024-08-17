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
        head = node
        tail = node
        count += 1
    }
}
