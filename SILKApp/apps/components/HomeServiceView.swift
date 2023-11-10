//
//  HomeServiceView.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/10/23.
//

import Foundation

import UIKit
import SnapKit


class HomeServiceView: UIView {
    
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
       return view
    }()
    
    let image: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Imagebuilding")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = .white
       return view
    }()
    
    let titleLabel: SilkLabel = {
      let label = SilkLabel()
        label.text = "PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja"
        label.setStyle(font: .proximaNovaSemibold, size: 14, color: Color.darkBlue)
        label.numberOfLines = 0
        return label
    }()
    
    let valueLabel: SilkLabel = {
      let label = SilkLabel()
        label.text = "Rp. 1.400.000"
        label.setStyle(font: .proximaNovaSemibold, size: 14, color: Color.orange)
        label.numberOfLines = 0
        return label
    }()
    
    let locationtitleLabel: SilkLabel = {
      let label = SilkLabel()
        label.text = "Lenmarc Surabaya"
        label.setStyle(font: .proximaNovaSemibold, size: 14, color: Color.darkgray)
        label.numberOfLines = 0
        return label
    }()
    
    let locationdescLabel: SilkLabel = {
      let label = SilkLabel()
        label.text = "Dukuh Pakis, Surabaya"
        label.setStyle(font: .proximaNovaRegular, size: 12, color: Color.lightgray)
        label.numberOfLines = 0
        return label
    }()
    
    
    let locationTitleIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "fa-solid_hospital")
       return view
    }()
    
    
    
    let locationdescIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "fluent_location-28-filled")
    
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
        addSubview(image)
        addSubview(titleLabel)
        addSubview(valueLabel)
        addSubview(locationTitleIcon)
        addSubview(locationdescIcon)
        addSubview(locationtitleLabel)
        addSubview(locationdescLabel)
        
        image.snp.makeConstraints({ make in
            make.top.trailing.bottom.equalToSuperview()
            make.width.equalTo(120)
            
        })
        titleLabel.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(image.snp.leading).offset(-20)
        })

        valueLabel.snp.makeConstraints({ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(image.snp.leading).offset(20)
        })

        locationTitleIcon.snp.makeConstraints({ make in
            make.top.equalTo(valueLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(12)
            make.height.equalTo(14)
        })

        locationdescIcon.snp.makeConstraints({ make in
            make.top.equalTo(locationTitleIcon.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(14)
            make.height.equalTo(14)
        })

        locationtitleLabel.snp.makeConstraints({ make in
            make.centerY.equalTo(locationTitleIcon)
            make.leading.equalTo(locationTitleIcon.snp.trailing).offset(8)

        })

        locationdescLabel.snp.makeConstraints({ make in
            make.centerY.equalTo(locationdescIcon)
            make.leading.equalTo(locationdescIcon.snp.trailing).offset(8)
        })
        
        
        
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct HomeServiceView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewPreview {
                HomeServiceView()
            }.previewLayout(.fixed(width: 335, height: 150))
        }
    }
}
#endif

