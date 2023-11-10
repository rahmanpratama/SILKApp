//
//  ProfileView.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/10/23.
//

import Foundation
import SnapKit
import UIKit

class ProfileView: UIView {
    
    let scrollview = UIScrollView()
    
    let customNavBar = SilkNavigationBar()
    
    lazy var categoryType: HomeProductCollectionView = {
        let view = HomeProductCollectionView()
         view.categoryList = ["Satuan", "Paket Pemeriksaan"]
         view.backgroundCellStyle = Color.cyan
         view.fontCellStyle = Color.darkBlue
         view.listCategory.reloadData()
    
        return view
    }()
    
    let container: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        
        view.layer.borderColor = Color.lightgray.cgColor
        view.setShadow()
        view.layer.borderWidth = 0.3
        view.clipsToBounds = false
        return view
    }()
    
    let profileImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "profileImage")
        return image
    }()
    
    let backgroundBanner: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "profile_banner_bg")
        return view
    }()
    
    let titleName: SilkLabel = {
        let label = SilkLabel()
        label.setStyle(font: .gilroyBold, size: 18, color: .white)

        let attributedText = NSMutableAttributedString(string: "Angga ")

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.font(size: 18, fontType: .gilroySemibold),
            .foregroundColor: UIColor.white
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
    

    
    let descLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .proximaNovaRegular, size: 12, color: .white)
        label.text = "Lengkapi profile anda untuk memaksimalkan penggunaan aplikasi"
        label.numberOfLines = 0
        return label
    }()
    
    let titleFormLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 16, color: Color.darkBlue)
        label.text = "Pilih Data yang ingin ditampilkan"
        label.numberOfLines = 0
        return label
    }()
    
    let titleDataDiriLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .proximaNovaSemibold, size: 14, color: Color.darkBlue)
        label.text = "Data Diri"
        label.numberOfLines = 0
        return label
    }()
    
    let subtitleDataDiriLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .proximaNovaRegular, size: 10, color: Color.lightgray)
        label.text = "Data diri anda Sesuai dengan KTP"
        label.numberOfLines = 0
        return label
    }()
    
    let profileIconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 18
        view.backgroundColor = Color.cyan
        return view
    }()
    
    let profileIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profile_icon")
        return view
    }()
    
    let mapsIconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 18
        view.backgroundColor = Color.lightgray
        return view
    }()
    
    let mapsIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "map_marker_gray")
        return view
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

    
    let infoIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "info_circle")
        return view
    }()
    
    let infoLabel: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .proximaNovaRegular, size: 12, color: Color.lightgray)
        label.text = "Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya"
        label.numberOfLines = 0
        return label
    }()
    
    
    lazy var button: SilkButton = {
       let button = SilkButton()
        button.setTitle("Simpan Profile", for: .normal)
        button.titleLabel?.font = UIFont.font(size: 14, fontType: .gilroySemibold)
        button.setRightIcon(icon: UIImage(named: "disk_icon"))
        return button
    }()
    
    let bottomBar: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "bottombar")
        return view
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
        scrollview.backgroundColor = .white
        addSubview(customNavBar)
        addSubview(scrollview)
        
        scrollview.addSubview(categoryType)
        scrollview.addSubview(container)
        container.addSubview(backgroundBanner)
        backgroundBanner.addSubview(titleName)
        backgroundBanner.addSubview(subtitle)
        backgroundBanner.addSubview(profileImage)
        backgroundBanner.addSubview(descLabel)
        container.addSubview(titleFormLabel)
        container.addSubview(profileIconContainer)
        profileIconContainer.addSubview(profileIcon)
        container.addSubview(mapsIconContainer)
        mapsIconContainer.addSubview(mapsIcon)
        container.addSubview(titleDataDiriLabel)
        container.addSubview(subtitleDataDiriLabel)
        
        container.addSubview(firstNameInput)
        container.addSubview(lastNameInput)
        container.addSubview(emailInput)
        container.addSubview(phoneInput)
        container.addSubview(ktpInput)
        
        container.addSubview(infoIcon)
        container.addSubview(infoLabel)
        container.addSubview(button)
        
        scrollview.addSubview(bottomBar)
        
        customNavBar.snp.makeConstraints({ make in
            make.leading.trailing.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(50)
        })

        scrollview.snp.makeConstraints({ make in
            make.width.equalToSuperview()
            make.top.equalTo(customNavBar.snp.bottom)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        })
        
        categoryType.snp.makeConstraints({ make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(40)
            make.top.equalToSuperview().offset(32)
        })
        
        container.snp.makeConstraints({ make in
            make.top.equalTo(categoryType.snp.bottom).offset(32)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(32)
            make.bottom.equalTo(bottomBar.snp.top).offset(-20)
            make.height.equalTo(930)
        })
        backgroundBanner.contentMode = .scaleToFill
        backgroundBanner.snp.makeConstraints({ make in
            make.width.equalToSuperview().multipliedBy(1.01)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(160)
            
        })
        
        profileImage.snp.makeConstraints({ make in
            make.leading.equalTo(24)
            make.top.equalToSuperview().offset(40)
            make.height.width.equalTo(40)
        })
        
        titleName.snp.makeConstraints({ make in
            make.top.equalTo(profileImage)
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
        })
        
        subtitle.snp.makeConstraints({ make in
            make.top.equalTo(titleName.snp.bottom).offset(4)
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
        })
        
        descLabel.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
        })
        
        titleFormLabel.snp.makeConstraints({ make in
            make.top.equalTo(backgroundBanner.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(20)
        })
        
        profileIconContainer.snp.makeConstraints({ make in
            make.top.equalTo(titleFormLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
            make.height.width.equalTo(40)
        })
        
        profileIcon.snp.makeConstraints({ make in
            make.center.equalToSuperview()
            make.height.width.equalTo(24)
        })
        
        mapsIconContainer.snp.makeConstraints({ make in
            make.top.equalTo(profileIcon).offset(-12)
            make.leading.equalTo(subtitleDataDiriLabel.snp.trailing).offset(16)
            make.height.width.equalTo(40)
        })
        
        mapsIconContainer.clipsToBounds = true
        
        mapsIcon.snp.makeConstraints({ make in
            make.center.equalToSuperview()
           
        })
        
        titleDataDiriLabel.snp.makeConstraints({ make in
            make.leading.equalTo(profileIconContainer.snp.trailing).offset(16)
            make.top.equalTo(profileIconContainer)
        })
        
        subtitleDataDiriLabel.snp.makeConstraints({ make in
            make.leading.equalTo(profileIconContainer.snp.trailing).offset(16)
            make.top.equalTo(titleDataDiriLabel.snp.bottom).offset(2)
        })
        
        firstNameInput.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(profileIconContainer.snp.bottom).offset(32)
        })
        
        lastNameInput.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(firstNameInput.snp.bottom).offset(32)
        })
        
        emailInput.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(lastNameInput.snp.bottom).offset(32)
        })
        
        phoneInput.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(emailInput.snp.bottom).offset(32)
        })
        
        ktpInput.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(phoneInput.snp.bottom).offset(32)
        })
        
        infoIcon.snp.makeConstraints({ make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(ktpInput.snp.bottom).offset(32)
            make.height.width.equalTo(16)
           
        })
        
        infoLabel.snp.makeConstraints({ make in
            make.top.equalTo(ktpInput.snp.bottom).offset(30)
            make.leading.equalTo(infoIcon.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-30)
        })
        
        button.snp.makeConstraints({ make in
            make.top.equalTo(infoLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(36)
        })
        
        
        
        bottomBar.snp.makeConstraints({ make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
//            make.top.equalTo(container.snp.bottom).offset(-16)
            make.bottom.equalToSuperview()
            make.height.equalTo(110)
            
        })
        
        
        
        
    }
}



#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ProfileView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewPreview {
                ProfileView()
            }
        }
    }
}
#endif
