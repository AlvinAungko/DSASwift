//
//  HomeVc.swift
//  DSASwift
//
//  Created by Alvin  on 14/11/2023.
//

import UIKit

protocol HomeVcDelegate: AnyObject {
    func didAddStudent(student: StudentModel)
}

class HomeVc: UIViewController, Storyboarded {
    
    static var storyboard: String = "Main"
    
    @IBOutlet weak var btnSort: UIButton!
    @IBOutlet weak var txtSearchField: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tableView: SelfSizedTableView!
    @IBOutlet weak var heightConst: NSLayoutConstraint!
    
    public var listOfStudents: DoublyLinkedList<StudentModel> = StudentMockData.generateMockData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        initBindings()
        txtSearchField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
        self.heightConst.constant = tableView.contentSize.height
    }
    
    private func initBindings() {
        btnAdd.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
        btnSort.addTarget(self, action: #selector(self.handleSort), for: .touchUpInside)
    }
    
    @objc func handleSort() {
        do {
            try listOfStudents.sort()
            self.tableView.reloadData()
        } catch {
            guard let error = error as? DoublyLinkedListError else { return }
            debugPrint(error.errorMessage)
        }
        
    }
    
    @objc func handleAdd() {
        let vc = StudentAddVc.instantiate(from: .main)
        vc.delegate = self
        self.present(vc, animated: true)
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(nib: StudentInformationCell.className, bundle: nil)
        tableView.contentInset = .zero
        tableView.isScrollEnabled = false
        tableView.fitToContentHeight(heightConstraint: heightConst)
        tableView.separatorStyle = .none
    }
    
}

extension HomeVc: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfStudents.getAllValues().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StudentInformationCell.className, for: indexPath) as? StudentInformationCell else {
            return UITableViewCell()
        }
        let student = listOfStudents.getAllValues()[indexPath.row]
        cell.item = student
        cell.onDel = {
            let vc = DeleteStudentDialogVc()
            vc.onTapDel = {
                do {
                    try self.listOfStudents.delete(value: student)
                    self.tableView.reloadData()
                    self.heightConst.constant = tableView.contentSize.height
                } catch {
                    guard let error = error as? DoublyLinkedListError else { return }
                    debugPrint(error.errorMessage)
                }
            }
            self.present(vc, animated: true)
        }
        
        return cell
    }
}

extension HomeVc: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let student = self.listOfStudents.getAllValues().filter({ $0.studentName == textField.text ?? "" }).first {
            if listOfStudents.search(value: student) {
                let vc = StudentStatusFoundDialog()
                self.present(vc, animated: true)
            } else {
                debugPrint("Not Found")
            }
        } else {
            debugPrint("Not Found")
        }
        return true
    }
}

extension HomeVc: HomeVcDelegate {
    func didAddStudent(student: StudentModel) {
        self.listOfStudents.insert(value: student)
        
        do {
            try listOfStudents.sort()
            self.tableView.reloadData()
            self.heightConst.constant = tableView.contentSize.height
        } catch {
            guard let error = error as? DoublyLinkedListError else { return }
            debugPrint(error.errorMessage)
        }
        
    }
}
