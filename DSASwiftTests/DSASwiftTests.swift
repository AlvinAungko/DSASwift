//
//  DSASwiftTests.swift
//  DSASwiftTests
//
//  Created by Aung Ko Ko on 16/11/2023.
//

import XCTest
import DSASwift

class DoublyLinkedListTests: XCTestCase {
    
    func testDoublyLinkedList() {
        
        let linkedList = DoublyLinkedList<StudentModel>()
        
        // Insert values
        linkedList.insert(value: .init(studentName: "Aung Ko Ko", studentID: 1, studentAge: 23))
        linkedList.insert(value: .init(studentName: "Min Thant Kyaw", studentID: 2, studentAge: 23))
        linkedList.insert(value: .init(studentName: "Ko Zarni Nway Oo", studentID: 3, studentAge: 23))
        linkedList.insert(value: .init(studentName: "Phone Pyae Naing", studentID: 4, studentAge: 23))
        
        let existingStudentToBeSearched: StudentModel = .init(studentName: "Ko Zarni Nway Oo", studentID: 3, studentAge: 23)
        let nonExistingStudentToBeSearched: StudentModel = .init(studentName: "Pyae Sone Thant Kyaw", studentID: 3, studentAge: 23)
        let studentToBeDeleted: StudentModel = .init(studentName: "Min Thant Kyaw", studentID: 2, studentAge: 23)
        
        // Log inserted values
        linkedList.getAllValues().forEach({ 
            debugPrint("Inserted Values = \($0.studentName)")
        })
        
        // Test searching
        XCTAssertTrue(linkedList.search(value: existingStudentToBeSearched), "Search for an existing student succeeded.")
        XCTAssertFalse(linkedList.search(value: nonExistingStudentToBeSearched), "Search for a non-existing student succeeded.")
        
        // Sort the list
        do {
            try linkedList.sort()
            print("List after sorting: \(linkedList.getAllValues())")
        } catch {
            XCTFail("Sorting failed with error: \(error.localizedDescription)")
        }
        
        // Test searching after sorting
        XCTAssertTrue(linkedList.search(value: existingStudentToBeSearched), "Search after sorting succeeded.")
        
        // Delete values
        do {
            try linkedList.delete(value: studentToBeDeleted)
            print("List after deletion: \(linkedList.getAllValues())")
        } catch {
            XCTFail("Deletion failed with error: \(error.localizedDescription)")
        }
        
        // Test searching after deletion#imageLiteral(resourceName: "Screenshot 2023-11-16 at 01.17.19.png")
        XCTAssertFalse(linkedList.search(value: studentToBeDeleted), "Search after deletion succeeded.")
    }
}

