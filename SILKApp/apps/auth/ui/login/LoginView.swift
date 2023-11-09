//
//  LoginView.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import UIKit
import SnapKit

protocol LoginViewDelegate : AnyObject {
    func didButtonPressed()
    func didPressRegisterNow()
}

class LoginView : UIView {

    
    weak var delegate: LoginViewDelegate?
    
    let welcomeLabel: SilkLabel = {
        let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 28, color: Color.darkBlue)

        let attributedText = NSMutableAttributedString(string: "Hai, ")

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.font(size: 28, fontType: .gilroyBold),
            .foregroundColor: Color.darkBlue
        ]

        let subText = NSAttributedString(string: "Selamat Datang", attributes: attributes)

        attributedText.append(subText)

        label.attributedText = attributedText

        return label
    }()
    
    let subWelcomeLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 12, color: Color.gray)
        label.text = "Silahkan login untuk melanjutkan"
        return label
    }()
    
    let welcomeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "welcome_image")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailInput: SilkInputField = {
       let field = SilkInputField()
        field.setStyle(title: "Email", placeholder: "Masukan email anda")
        return field
    }()
    
    lazy var passwordInput: SilkInputField = {
       let field = SilkInputField()
        field.setStyle(title: "Password", placeholder: "Masukan password anda")
        field.textfield.isSecureTextEntry = true
        field.showRightIcon(image: UIImage(named: "fluent_eye"))
        
        return field
    }()
    
    lazy var button: SilkButton = {
       let button = SilkButton()
        button.setTitle("Login", for: .normal)
        button.setRightIcon(icon: UIImage(named: "arrow_right"))
        return button
    }()
    
    let registerLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .proximaNovaRegular, size: 12, color: Color.lightgray)
        label.text = "Belum punya akun ?"
        label.textAlignment = .right
        return label
    }()
    
    let registerNowLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .proximaNovaSemibold, size: 12, color: Color.darkBlue)
        label.text = "Daftar Sekarang"
        label.textAlignment = .left
        return label
    }()
    
    let copyrightLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .proximaNovaSemibold, size: 12, color: Color.lightgray)
        label.text = "© SILK. all rights reserved."
        label.textAlignment = .left
        return label
    }()
    
    let warningLabel: SilkLabel = {
      let label = SilkLabel()
        label.setStyle(font: .proximaNovaRegular, size: 12, color: Color.red)
        label.text = "Password harap diisi dengan benar"
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
        addSubview(subWelcomeLabel)
        addSubview(welcomeImage)
        addSubview(emailInput)
        addSubview(passwordInput)
        addSubview(button)
        addSubview(copyrightLabel)
        // temporary
        addSubview(warningLabel)
        
        welcomeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(110)
        }
        
        subWelcomeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(4)
        }
        
        welcomeImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalTo(subWelcomeLabel.snp.bottom)
        }
        
        emailInput.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(welcomeImage.snp.bottom).offset(-12)
        }
        
        passwordInput.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(emailInput.snp.bottom).offset(40)
        }
        
        warningLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(passwordInput.snp.bottom).offset(8)
        }
        
        warningLabel.isHidden = true
        
        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(passwordInput.snp.bottom).offset(40)
        }
        
        let textStackView = UIStackView()
        
        textStackView.addArrangedSubview(registerLabel)
        textStackView.addArrangedSubview(registerNowLabel)
        textStackView.axis = .horizontal
        textStackView.spacing = 8
        addSubview(textStackView)
        
        textStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button.snp.bottom).offset(30)
        }
        
        copyrightLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textStackView.snp.bottom).offset(12)
        }
        
        button.addTapGestureRecognizer(action: {
            self.delegate?.didButtonPressed()
        })
        
        registerNowLabel.addTapGestureRecognizer(action: {
            self.delegate?.didPressRegisterNow()
        })
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        passwordInput.rightIcon.isUserInteractionEnabled = true
        passwordInput.rightIcon.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        passwordInput.textfield.isSecureTextEntry.toggle()
        
    }
    
}



#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewPreview {
                LoginView()
            }
        }
    }
}
#endif


    

