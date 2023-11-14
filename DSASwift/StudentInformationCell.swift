//
//  StudentInformationCell.swift
//  DSASwift
//
//  Created by Alvin  on 14/11/2023.
//

import UIKit

class StudentInformationCell: UITableViewCell {

    @IBOutlet weak var lblStudentName: UILabel!
    @IBOutlet weak var lblStudentAge: UILabel!
    @IBOutlet weak var lblStudentID: UILabel!
    @IBOutlet weak var btnDel: UIButton!
    
    var onDel: (() -> Void)?
    var item: StudentModel? {
        didSet {
            if let item = item {
                self.bindData(item)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initBindings()
        self.selectionStyle = .none
    }
    
    private func initBindings() {
        btnDel.addTarget(self, action: #selector(self.handleDel), for: .touchUpInside)
    }
    
    private func bindData(_ item: StudentModel) {
        lblStudentName.text = item.studentName
        lblStudentAge.text = "\(item.studentAge)"
        lblStudentID.text = "\(item.studentID)"
    }
    
    @objc func handleDel() {
        onDel?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
