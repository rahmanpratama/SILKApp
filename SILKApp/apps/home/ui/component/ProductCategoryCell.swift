//
//  ProductCategoryCell.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/9/23.
//

import Foundation
import SnapKit
import UIKit


class ProductCategoryCell: UICollectionViewCell {
    
    let titleLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .proximaNovaSemibold, size: 12, color: Color.darkBlue)
        return label
    }()
    var backgroundStyle: UIColor = Color.darkBlue
    
    let container: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.layer.borderColor = Color.lightgray.cgColor
        container.layer.borderWidth = 0.1
        container.layer.cornerRadius = 15
        return container
    }()
    
    override var isSelected: Bool {
        didSet {
            setupSelection()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createView()
    }
    
    private func createView(){
        
        contentView.addSubview(container)
        contentView.addSubview(titleLabel)
        container.snp.makeConstraints({ make in
            make.leading.equalTo(titleLabel.snp.leading).inset(-25)
            make.trailing.equalTo(titleLabel.snp.trailing).offset(25)
            make.height.equalTo(titleLabel).multipliedBy(1.4)
            make.centerY.equalTo(titleLabel).offset(0)
        })
        
        titleLabel.snp.makeConstraints({ make in
            make.centerX.equalTo(contentView)
            make.centerY.equalTo(contentView).offset(1)
        })
        
        contentView.snp.makeConstraints({ make in
            make.edges.equalTo(container)
            make.height.equalTo(30)
        })
        
    }
    
    func setupView(titleLabel: String) {
        self.titleLabel.text = titleLabel
    }
    
    private func setupSelection() {
        if isSelected {
            // Update cell appearance when selected
            self.container.backgroundColor = backgroundStyle
            self.titleLabel.textColor = .white
        } else {
            // Update cell appearance when deselected
            self.container.backgroundColor = .white
            self.titleLabel.textColor = Color.darkBlue
        }
    }
    
}
