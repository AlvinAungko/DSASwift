//
//  LinkedList.swift
//  DSASwift
//
//  Created by Alvin  on 14/11/2023.
//

import Foundation

class Node<T: Comparable> {
    var value: T
    var next: Node?
    weak var previous: Node?
    
    init(value: T) {
        self.value = value
    }
}

class DoublyLinkedList<T: Comparable> {
    
    var head: Node<T>?
    
    // Search for a value in the list
    func search(value: T) -> Bool {
        var current = head
        while let node = current {
            if node.value == value {
                return true
            }
            current = node.next
        }
        return false
    }
    
    // Insert a value at the end of the list
    func insert(value: T) {
        let newNode = Node(value: value)
        
        guard let headNode = head else {
            // If the list is empty, set the new node as the head
            head = newNode
            return
        }
        
        var current = headNode
        while let nextNode = current.next {
            current = nextNode
        }
        
        current.next = newNode
        newNode.previous = current
    }

    
    // Sort the list in ascending order
    func sort() throws {
        guard head != nil else {
            throw DoublyLinkedListError.invalidOperation
        }
        
        do {
            head = try mergeSort(head)
        } catch {
            guard let linkedListError = error as? DoublyLinkedListError else { return }
            debugPrint(linkedListError.errorMessage)
        }
    }
    
    // Delete a node with a specific value from the list
    func delete(value: T) throws {
        var current = head
        while let node = current {
            if node.value == value {
                if let previous = node.previous {
                    previous.next = node.next
                    node.next?.previous = previous
                } else {
                    // If the node to delete is the head, update the head
                    head = node.next
                    node.next?.previous = nil
                }
                return
            }
            current = node.next
        }
//        throw DoublyLinkedListError.valueNotFound
    }

    func filter(predicate: (T) -> Bool) -> DoublyLinkedList<T> {
        let filteredList = DoublyLinkedList<T>()
        var current = head
        
        while let node = current {
            if predicate(node.value) {
                filteredList.insert(value: node.value)
            }
            current = node.next
        }
        
        return filteredList
    }
    
    
    func getAllValues() -> [T] {
        var values = [T]()
        var current = head
        while let node = current {
            values.append(node.value)
            current = node.next
        }
        return values
    }
    
    
    private func mergeSort(_ head: Node<T>?) throws -> Node<T>? {
        guard head != nil else {
            throw DoublyLinkedListError.invalidOperation
        }
        
        // If there's only one element, no need to sort
        guard head?.next != nil else {
            return head
        }
        
        do {
            let middle = try getMiddle(head)
            let nextToMiddle = middle?.next
            
            middle?.next = nil
            
            let left = try mergeSort(head)
            let right = try mergeSort(nextToMiddle)
            
            do {
                return try merge(left, right)
            } catch {
                guard let linkedListError = error as? DoublyLinkedListError else { return nil }
                debugPrint(linkedListError.errorMessage)
                return nil
            }
        } catch {
            guard let linkedListError = error as? DoublyLinkedListError else { return nil }
            debugPrint(linkedListError.errorMessage)
            return nil
        }
        
    }
    
    private func merge(_ left: Node<T>?, _ right: Node<T>?) throws -> Node<T>? {
        guard let left = left else { return right }
        guard let right = right else { return left }
        
        if left.value < right.value {
            left.next = try merge(left.next, right)
            left.next?.previous = left
            left.previous = nil
            return left
        } else {
            right.next = try merge(left, right.next)
            right.next?.previous = right
            right.previous = nil
            return right
        }
    }
    
    private func getMiddle(_ head: Node<T>?) throws -> Node<T>? {
        var slow = head
        var fast = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        guard let middle = slow else {
            throw DoublyLinkedListError.invalidOperation
        }
        return middle
    }
}
