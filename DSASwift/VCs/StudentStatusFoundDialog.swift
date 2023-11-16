//
//  StudentStatusFoundDialog.swift
//  DSASwift
//
//  Created by Alvin  on 15/11/2023.
//

import Foundation
import UIKit

class StudentStatusFoundDialog: BaseDialogVC {

    let btnDel = UIButton()
    let btnCancel = UIButton()
    let lblConfirmDelete = UILabel()
    let lblDelDesc = UILabel()
    
    var onTapDel: (() -> Void)?
    var studentSearchStatus: StudentSearchStatus?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        setUpView()
        initBindings()
    }
    
    private func setUpView() {
        
        lblConfirmDelete.font = .boldSystemFont(ofSize: 16)
        lblConfirmDelete.textAlignment = .center
        lblConfirmDelete.numberOfLines = 0
        lblConfirmDelete.text = "Searching Student!"
        lblConfirmDelete.translatesAutoresizingMaskIntoConstraints = false
        
        lblDelDesc.textColor = .black
        lblDelDesc.font = .systemFont(ofSize: 14, weight: .medium)
        lblDelDesc.textAlignment = .center
        lblDelDesc.numberOfLines = 0
        lblDelDesc.text = studentSearchStatus?.status
        lblDelDesc.translatesAutoresizingMaskIntoConstraints = false
        
        btnDel.setTitle("Done", for: .normal)
        btnDel.translatesAutoresizingMaskIntoConstraints = false
        btnDel.translatesAutoresizingMaskIntoConstraints = false
        btnDel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        btnDel.backgroundColor = .red
        btnDel.layer.cornerRadius = 8
        
        let horizontalStackView = UIStackView(arrangedSubviews: [
           btnDel
        ])
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.alignment = .fill
        horizontalStackView.spacing = 16
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addMultilpleSubViews(views: [
            self.lblConfirmDelete,
            self.lblDelDesc,
            horizontalStackView
        ])
        
        NSLayoutConstraint.activate([
            
            lblConfirmDelete.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 12),
            lblConfirmDelete.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            lblConfirmDelete.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            lblDelDesc.topAnchor.constraint(equalTo: lblConfirmDelete.bottomAnchor, constant: 8),
            lblDelDesc.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            lblDelDesc.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            horizontalStackView.topAnchor.constraint(equalTo: lblDelDesc.bottomAnchor, constant: 16),
            horizontalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            horizontalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            
        ])
        
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 0.5 // Adjust the opacity as needed
        view.layer.shadowOffset = CGSize(width: 1, height: 1) // Adjust the offset as needed
        view.layer.shadowRadius = 5
    }
    
    private func initBindings() {
        btnDel.addTarget(self, action: #selector(self.handleDel), for: .touchUpInside)
        btnCancel.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
    }
    
    @objc func handleDel() {
        self.dismiss(animated: true)
    }
    
    @objc func handleCancel() {
        self.dismiss(animated: true)
    }
    
    func addMultilpleSubViews(views: [UIView]) {
        views.forEach {
            self.view.addSubview($0)
        }
    }
    

}
