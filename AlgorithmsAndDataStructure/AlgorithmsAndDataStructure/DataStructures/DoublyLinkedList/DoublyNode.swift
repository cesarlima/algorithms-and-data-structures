//
//  DoublyNode.swift
//  AlgorithmsAndDataStructure
//
//  Created by MacPro on 17/08/24.
//

import Foundation

final class DoublyNode<T: Equatable> {
    private(set) var value: T
    private(set) var next: DoublyNode<T>?
    private(set) var prev: DoublyNode<T>?
    
    init(value: T) {
        self.value = value
    }
    
    func setNext(_ next: DoublyNode<T>?) {
        self.next = next
    }
    
    func setPrevious(_ prev: DoublyNode<T>?) {
        self.prev = prev
    }
    
    func setValue(_ value: T) {
        self.value = value
    }
}
