//
//  LoginView.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import UIKit
import SnapKit

class LoginView : UIView {

    let welcomeLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 28, color: Color.darkBlue)
        label.text = "Hai, Selamat Datang"
        return label
    }()
    
    let description: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 28, color: Color.darkBlue)
        label.text = "Hai, Selamat Datansgs"
        return label
    }()
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
 
    func setupView() {
        
        
        backgroundColor = .white
        
        addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}
