//
//  HomeSidebarVc.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/10/23.
//

import Foundation
import UIKit
import SnapKit

protocol HomeSidebarVcDelegate: AnyObject {
    func didCancelPressed()
    func didPressButton()
    func didPressProfile()
}

class HomeSidebarVc: UIViewController {
    
    
    weak var delegate: HomeSidebarVcDelegate?
    let container = UIView()
    
    let titleName: SilkLabel = {
        let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 14, color: Color.darkBlue)

        let attributedText = NSMutableAttributedString(string: "Angga ")

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.font(size: 14, fontType: .gilroyBold),
            .foregroundColor: Color.darkBlue
        ]

        let subText = NSAttributedString(string: "Praja", attributes: attributes)

        attributedText.append(subText)

        label.attributedText = attributedText

        return label
    }()

    let subtitle: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 12, color: Color.gray)
        label.text = "Membership BBLK"
        return label
    }()

    let profileLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 12, color: Color.gray)
        label.text = "Profile Saya"
        return label
    }()

    let settingLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 12, color: Color.gray)
        label.text = "Pengaturan"
        return label
    }()

    let rightIcon1: UIImageView = {
       let label = UIImageView()
        label.image = UIImage(named: "chevron_right")
        return label
    }()

    let rightIcon2: UIImageView = {
       let label = UIImageView()
        label.image = UIImage(named: "chevron_right")
        return label
    }()

    let button: SilkButton = {
        let button = SilkButton()
        button.setTitle("Logout", for: .normal)
        button.titleLabel?.font = UIFont.font(size: 12, fontType: .gilroySemibold)
        button.backgroundColor = Color.red
        button.layer.cornerRadius = 14
        return button
    }()

    let followUsLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroyMedium, size: 16, color: Color.gray)
        label.text = "Ikuti Kami di"
        return label
    }()

    let facebookIcon: UIImageView = {
       let label = UIImageView()
        label.image = UIImage(named: "facebook_icon")
        return label
    }()

    let instagramIcon: UIImageView = {
       let label = UIImageView()
        label.image = UIImage(named: "instagram_icon")
        return label
    }()

    let twitterIcon: UIImageView = {
       let label = UIImageView()
        label.image = UIImage(named: "twitter_icon")
        return label
    }()
    
    let profileImage: UIImageView = {
       let label = UIImageView()
        label.image = UIImage(named: "profileImage")
        return label
    }()
    
    let xIcon: UIImageView = {
       let label = UIImageView()
        label.image = UIImage(named: "xicon")
        label.isUserInteractionEnabled = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0.125, blue: 0.376, alpha: 0.8)
        container.backgroundColor = .white
        view.addSubview(container)
        view.addSubview(profileImage)
        view.addSubview(titleName)
        view.addSubview(subtitle)
        view.addSubview(profileLabel)
        view.addSubview(settingLabel)
        view.addSubview(rightIcon1)
        view.addSubview(rightIcon2)
        view.addSubview(button)
        view.addSubview(followUsLabel)
        view.addSubview(facebookIcon)
        view.addSubview(instagramIcon)
        view.addSubview(twitterIcon)
        view.addSubview(xIcon)
        
        container.snp.makeConstraints({ make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(60)
        })
        profileImage.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalTo(container).offset(40)
            make.width.height.equalTo(40)
        })
        
        titleName.snp.makeConstraints({ make in
            make.top.equalTo(profileImage).offset(4)
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
        })
        
        subtitle.snp.makeConstraints({ make in
            make.top.equalTo(titleName.snp.bottom).offset(2)
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
        })
        
        profileLabel.snp.makeConstraints({ make in
            make.top.equalTo(profileImage.snp.bottom).offset(40)
            make.leading.equalTo(profileImage.snp.leading)
        })
        
        rightIcon1.snp.makeConstraints({ make in
            make.centerY.equalTo(profileLabel)
            make.trailing.equalTo(subtitle)
            make.width.height.equalTo(20)
        })
        
        settingLabel.snp.makeConstraints({ make in
            make.top.equalTo(profileLabel.snp.bottom).offset(16)
            make.leading.equalTo(profileImage.snp.leading)
        })
        
        rightIcon2.snp.makeConstraints({ make in
            make.centerY.equalTo(settingLabel)
            make.trailing.equalTo(subtitle)
            make.width.height.equalTo(20)
        })
        
        button.snp.makeConstraints({ make in
            make.top.equalTo(settingLabel.snp.bottom).offset(40)
            make.leading.equalTo(settingLabel)
            make.trailing.equalTo(rightIcon1.snp.leading)
            make.height.equalTo(28)
        })
        
        let stackView = UIStackView(arrangedSubviews: [followUsLabel, facebookIcon, instagramIcon, twitterIcon])
        stackView.spacing = 4
        view.addSubview(stackView)
       
        
        facebookIcon.snp.makeConstraints({ make in
            make.height.width.equalTo(16)
        })
        
        instagramIcon.snp.makeConstraints({ make in
            make.height.width.equalTo(16)
        })
        
        twitterIcon.snp.makeConstraints({ make in
            make.height.width.equalTo(16)
        })
        
        stackView.snp.makeConstraints({ make in
            make.top.equalTo(button.snp.bottom).offset(80)
            make.centerX.equalTo(titleName)
        
        })
        
        xIcon.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(80)
            make.trailing.equalTo(container.snp.leading).offset(-16)
            make.width.height.equalTo(24)
        })
        
        xIcon.addTapGestureRecognizer(action: {
            self.delegate?.didCancelPressed()
        })
        
        button.addTapGestureRecognizer(action: {
            self.delegate?.didPressButton()
        })
        
        profileLabel.addTapGestureRecognizer(action: {
            self.delegate?.didPressProfile()
        })
        
        rightIcon1.addTapGestureRecognizer(action: {
            self.delegate?.didPressProfile()
        })
    }
}
