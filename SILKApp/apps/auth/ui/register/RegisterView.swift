//
//  RegisterView.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/10/23.
//

import Foundation
import UIKit
import SnapKit

protocol RegisterViewDelegate : AnyObject {
    func didButtonPressed()
    func didPressLoginNow()
}

class RegisterView : UIView {

    
    weak var delegate: RegisterViewDelegate?
    
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
    
    lazy var firstNameInput: SilkInputField = {
       let field = SilkInputField()
        field.setStyle(title: "Nama Depan", placeholder: "Nama Depan")
        return field
    }()
    
    lazy var lastNameInput: SilkInputField = {
       let field = SilkInputField()
        field.setStyle(title: "Nama Belakang", placeholder: "Nama Belakang")
        return field
    }()
    
    lazy var ktpInput: SilkInputField = {
       let field = SilkInputField()
        field.setStyle(title: "No. KTP", placeholder: "Masukan No. KTP anda")
        return field
    }()
    
    lazy var emailInput: SilkInputField = {
       let field = SilkInputField()
        field.setStyle(title: "Email", placeholder: "Masukan email anda")
        return field
    }()
    
    lazy var phoneInput: SilkInputField = {
       let field = SilkInputField()
        field.setStyle(title: "No. Telepon", placeholder: "Masukan nomor telepon anda")
        return field
    }()
    
    lazy var passwordInput: SilkInputField = {
       let field = SilkInputField()
        field.setStyle(title: "Password", placeholder: "Masukan password anda")
        field.textfield.isSecureTextEntry = true
        field.showRightIcon(image: UIImage(named: "fluent_eye"))
        return field
    }()
    
    lazy var verifyPasswordInput: SilkInputField = {
       let field = SilkInputField()
        field.setStyle(title: "Password", placeholder: "Konfirmasi password anda")
        field.textfield.isSecureTextEntry = true
        field.showRightIcon(image: UIImage(named: "fluent_eye"))
        return field
    }()
    
    lazy var button: SilkButton = {
       let button = SilkButton()
        button.setTitle("Register", for: .normal)
        button.setRightIcon(icon: UIImage(named: "arrow_right"))
        return button
    }()
    
    let loginLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .proximaNovaRegular, size: 12, color: Color.lightgray)
        label.text = "Belum punya akun ?"
        label.textAlignment = .right
        return label
    }()
    
    let loginNowLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .proximaNovaSemibold, size: 12, color: Color.darkBlue)
        label.text = "Login Sekarang"
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
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
 
    func setupView() {
        
        let scrollview = UIScrollView()
        let textStackView = UIStackView()
        textStackView.axis = .horizontal
        textStackView.spacing = 8
        
        backgroundColor = .white
        addSubview(scrollview)
        addSubview(textStackView)
        scrollview.addSubview(welcomeLabel)
        scrollview.addSubview(subWelcomeLabel)
        scrollview.addSubview(welcomeImage)
        scrollview.addSubview(firstNameInput)
        scrollview.addSubview(lastNameInput)
        scrollview.addSubview(ktpInput)
        scrollview.addSubview(emailInput)
        scrollview.addSubview(phoneInput)
        scrollview.addSubview(passwordInput)
        scrollview.addSubview(verifyPasswordInput)
        addSubview(button)
        addSubview(copyrightLabel)
        textStackView.addArrangedSubview(loginLabel)
        textStackView.addArrangedSubview(loginNowLabel)
        
        scrollview.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(button.snp.top).offset(-12)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.equalToSuperview().offset(40)
        }

        subWelcomeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(4)
        }

        welcomeImage.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(subWelcomeLabel.snp.bottom)
        }


        firstNameInput.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(welcomeImage.snp.bottom).offset(-12)
        }

        lastNameInput.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(welcomeImage.snp.bottom).offset(-12)
        }

        emailInput.snp.makeConstraints { make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(firstNameInput.snp.bottom).offset(40)
        }

        phoneInput.snp.makeConstraints { make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(emailInput.snp.bottom).offset(40)
        }

        passwordInput.snp.makeConstraints { make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(phoneInput.snp.bottom).offset(40)
        }

        verifyPasswordInput.snp.makeConstraints { make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(passwordInput.snp.bottom).offset(40)
            make.bottom.equalToSuperview().inset(4)
        }

        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(textStackView.snp.top).offset(-30)
        }


        textStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(copyrightLabel.snp.top).offset(-12)
        }

        copyrightLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-12)
        }
        
        button.addTapGestureRecognizer(action: {
            self.delegate?.didButtonPressed()
        })
        
        loginNowLabel.addTapGestureRecognizer(action: {
            self.delegate?.didPressLoginNow()
        })
        
    }
    
}



#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct RegisterView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewPreview {
                RegisterView()
            }
        }
    }
}
#endif


    

