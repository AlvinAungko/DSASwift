//
//  StudentAddVc.swift
//  DSASwift
//
//  Created by Alvin  on 14/11/2023.
//

import UIKit

class StudentAddVc: UIViewController, Storyboarded {
    
    static var storyboard: String = "Main"
    
    @IBOutlet weak var txtFieldStudentName: UITextField!
    @IBOutlet weak var txtFieldStudentID: UITextField!
    @IBOutlet weak var txtFieldStudentAge: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    var studentName: String?
    var studentID: Int?
    var studentAge: Int?
    
    var delegate: HomeVcDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFieldStudentID.delegate = self
        txtFieldStudentName.delegate = self
        txtFieldStudentAge.delegate = self
        btnAdd.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
    }
    
    @objc func handleAdd() {
        if let studentName = self.studentName, let studentID = self.studentID, let studentAge = self.studentAge {
            self.dismiss(animated: true)
            delegate?.didAddStudent(student: StudentModel(studentName: studentName, studentID: studentID, studentAge: studentAge))
        }
        
    }
    
}

extension StudentAddVc: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtFieldStudentName {
            self.studentName = textField.text ?? ""
        } else if textField == txtFieldStudentID {
            guard let string = textField.text, let id = Int(string) else {
                return
            }
            self.studentID = id
        } else {
            guard let string = textField.text, let id = Int(string) else {
                return
            }
            self.studentAge = id
        }
    }
}
