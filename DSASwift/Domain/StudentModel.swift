//
//  StudentModel.swift
//  DSASwift
//
//  Created by Alvin  on 14/11/2023.
//

import Foundation

class StudentModel: Comparable {
    
    static func == (lhs: StudentModel, rhs: StudentModel) -> Bool {
        lhs.studentName == rhs.studentName
    }
    
    static func < (lhs: StudentModel, rhs: StudentModel) -> Bool {
        lhs.studentName < rhs.studentName
    }
    
    var studentName: String
    var studentID: Int
    var studentAge: Int
    
    init(studentName: String, studentID: Int, studentAge: Int) {
        self.studentName = studentName
        self.studentID = studentID
        self.studentAge = studentAge
    }
}

class StudentMockData {
    static func generateMockData() -> DoublyLinkedList<StudentModel> {
        let linkedList = DoublyLinkedList<StudentModel>()
        linkedList.insert(value: .init(studentName: "SampleA", studentID: 1, studentAge: 10))
        linkedList.insert(value: .init(studentName: "SampleC", studentID: 2, studentAge: 10))
        linkedList.insert(value: .init(studentName: "SampleD", studentID: 3, studentAge: 10))
        linkedList.insert(value: .init(studentName: "SampleB", studentID: 4, studentAge: 10))
        return linkedList
    }
    
}
