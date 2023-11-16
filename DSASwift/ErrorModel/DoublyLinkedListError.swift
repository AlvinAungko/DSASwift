//
//  DoublyLinkedListError.swift
//  DSASwift
//
//  Created by Alvin  on 14/11/2023.
//

import Foundation

public enum DoublyLinkedListError: Error {
    case valueNotFound
    case invalidOperation
    
    public var errorMessage: String {
        switch self {
        case .valueNotFound:
            return "Value is Not Found"
        case .invalidOperation:
            return "Operation is invalid."
        }
    }
}
