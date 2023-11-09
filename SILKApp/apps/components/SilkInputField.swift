//
//  SilkInputField.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation

class SilkInputField: UIView {
    
    let textfield: UITextField = {
       let textfield = UITextField()
        textfield.font = UIFont.font(size: 12, fontType: .proximaNovaSemibold)
        textfield.autocapitalizationType = .none
        textfield.textColor = Color.darkBlue
        return textfield
    }()
    
    let titleLabel: SilkLabel = {
      let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 16, color: Color.darkBlue)
        
        return label
    }()
    
    let container: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.shadowRadius = 24
        view.layer.shadowColor = UIColor(string: "#BEBEBE").cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 16)
        view.layer.shadowOpacity = 0.32
        return view
    }()
    
    let rightIcon: UIImageView = {
      let icon = UIImageView()
        icon.image = UIImage(named: "fluent_eye")
        icon.contentMode = .scaleAspectFit
        icon.isUserInteractionEnabled = true
        return icon
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
        backgroundColor = .clear
        
        addSubview(titleLabel)
        addSubview(container)
        container.addSubview(textfield)
        container.addSubview(rightIcon)
        titleLabel.snp.makeConstraints({ make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview()
        })
        container.backgroundColor = .white
        container.snp.makeConstraints({ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
            make.bottom.equalToSuperview()
        })
      
        textfield.snp.makeConstraints({ make in
            make.leading.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(rightIcon.snp.leading).offset(-8)
        })
      
        rightIcon.snp.makeConstraints({ make in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(16)
        })
        
        rightIcon.isHidden = true
        setStyle(title: "Title", placeholder: "PlaceHolder")
        

    }
    
    func setStyle(title: String, placeholder: String) {
        titleLabel.text = title
        textfield.placeholder = placeholder
        
        
        // set textfield font
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.font(size: 12, fontType: .proximaNovaRegular),
                    .foregroundColor: UIColor.gray
                ]
        let attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: placeholderAttributes)
        textfield.attributedPlaceholder = attributedPlaceholder
        
        
    }
    
    func showRightIcon(image: UIImage?) {
        rightIcon.isHidden = false
        rightIcon.image = image
    }
    
    
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SilkInputField_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewPreview {
                SilkInputField()
            }
        }
    }
}
#endif


    

