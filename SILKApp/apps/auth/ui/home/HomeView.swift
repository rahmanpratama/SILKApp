//
//  HomeView.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/9/23.
//

import Foundation
import UIKit
import SnapKit


class HomeView : UIView {
    
    let customNavBar = SilkNavigationBar()
    
    let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.showsVerticalScrollIndicator = false
        return scrollview
    }()
    
    // MARK: - Top Banner
    let topBannerTitle: SilkLabel = {
        let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 18, color: Color.darkBlue)

        let attributedText = NSMutableAttributedString(string: "Solusi, ")

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.font(size: 18, fontType: .gilroyBold),
            .foregroundColor: Color.darkBlue
        ]

        let subText = NSAttributedString(string: "Kesehatan Anda", attributes: attributes)

        attributedText.append(subText)

        label.attributedText = attributedText

        return label
    }()
    
    let topBannerDesc: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 12, color: Color.gray)
        label.text = "Update informasi seputar kesehatan semua bisa disini !"
        label.numberOfLines = 0
        return label
    }()
    
    
    let topBannerBackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "home_bg_banner")
        image.backgroundColor = .white
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 16
        image.layer.shadowRadius = 16
        image.layer.shadowColor = UIColor(string: "#BEBEBE").cgColor
        image.layer.shadowOffset = CGSize(width: -16, height: 0)
        image.layer.shadowOpacity = 0.32
        return image
    }()
    
    let topBannerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "top_banner_image")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let topBannerPageIndicator: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pageIndicator")
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var topBannerbutton: SilkButton = {
       let button = SilkButton()
        button.setTitle("Selengkapnya", for: .normal)
        button.titleLabel?.font = UIFont.font(size: 12, fontType: .gilroySemibold)
        return button
    }()
    
    
    // MARK: - Second Banner
    let secondBannerTitle: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 18, color: Color.darkBlue)
        label.text = "Layanan Khusus"
        return label
    }()
    
    let secondBannerDesc: SilkLabel = {
        let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 12, color: Color.gray)
        label.numberOfLines = 0
        label.setStyle(font: .gilroySemibold, size: 12, color: Color.gray)
        label.text = "Tes Covid 19, Cegah Corona Sedini Mungkin"
        return label
    }()

    
    let secondBannerBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.shadowRadius = 16
        view.layer.shadowColor = UIColor(string: "#BEBEBE").cgColor
        view.layer.shadowOffset = CGSize(width: -16, height: 0)
        view.layer.shadowOpacity = 0.16
        return view
    }()
    
    let secondBannerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "second_banner_image")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let secondBannerButtonTitle: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroyBold, size: 14, color: Color.darkBlue)
        label.text = "Daftar Tes"
        return label
    }()
    
    let secondBannerButtonIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow_right_blue")
        return image
    }()
    
    // MARK: - Last Banner
    let lastBannerTitle: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 18, color: Color.darkBlue)
        label.text = "Track Pemeriksaan"
        return label
    }()
    
    let lastBannerDesc: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 12, color: Color.gray)
        label.text = "Kamu dapat mengecek progress pemeriksaanmu disini"
        label.numberOfLines = 0
        return label
    }()

    
    let lastBannerBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.shadowRadius = 16
        view.layer.shadowColor = Color.lightgray.cgColor
        view.layer.shadowOffset = CGSize(width: -16, height: 0)
        view.layer.shadowOpacity = 0.16
        return view
    }()
    
    let lastBannerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "last_banner_image")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let lastBannerButtonTitle: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroyBold, size: 14, color: Color.darkBlue)
        label.text = "Track"
        return label
    }()
    
    let lastBannerButtonIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow_right_blue")
        return image
    }()
    
    
    // MARK: - Searchbar and Filter
    
    let filterContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.setShadow()
        return view
    }()
    
    let filterIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "filter_icon")
        return view
    }()
    
    let searchBar: SilkSearchBar = {
        let view = SilkSearchBar()
        return view
    }()
    // MARK: - Product List
    let productView: HomeProductCollectionView = {
        let view = HomeProductCollectionView()
        view.categoryList = ["All Product", "Layanan Kesehatan", "Alat Kesehatan"]
        view.listCategory.reloadData()
        view.autoSelectfirstIndex()
        return view
    }()
    
    // MARK: - Dummy Product View (For MockUps)
    let product1: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "product_item")
        return view
    }()
    
    let product2: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "product_item")
        return view
    }()
    
    // MARK: - Service Type
   
    let servicetypetitle: SilkLabel = {
       let label = SilkLabel()
        label.setStyle(font: .gilroySemibold, size: 16, color: Color.darkBlue)
        label.text = "Pilih Tipe Layanan Kesehatan Anda"
        return label
    }()

    lazy var categoryServiceType: HomeProductCollectionView = {
       let view = HomeProductCollectionView()
        view.categoryList = ["Satuan", "Paket Pemeriksaan"]
        view.backgroundCellStyle = Color.cyan
        view.fontCellStyle = Color.darkBlue
        view.listCategory.reloadData()
        
        return view
    }()
    
    lazy var productservice1: HomeServiceView = {
       let view = HomeServiceView()
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.2
        view.layer.cornerRadius = 16
        return view
        return view
        
    }()
    
    lazy var productservice2: HomeServiceView = {
       let view = HomeServiceView()
        view.image.image = UIImage(named: "imagebuilding2")
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.2
        view.layer.cornerRadius = 16
        return view
        
    }()
    
    let bottomBar: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "bottombar")
        view.layer.cornerRadius = 16
        return view
    }()
    
    // MARK: - SetupView
    
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
        addSubview(customNavBar)
        addSubview(scrollView)
        customNavBar.snp.makeConstraints({ make in
            make.leading.trailing.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(50)
        })
        scrollView.snp.makeConstraints({ make in
            make.width.equalToSuperview()
            make.top.equalTo(customNavBar.snp.bottom)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        })
        
        scrollView.addSubview(topBannerBackground)
        topBannerBackground.addSubview(topBannerTitle)
        topBannerBackground.addSubview(topBannerDesc)
        topBannerBackground.addSubview(topBannerImage)
        topBannerBackground.addSubview(topBannerbutton)
        topBannerBackground.addSubview(topBannerPageIndicator)
        
        topBannerBackground.snp.makeConstraints({ make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide ).inset(20)
            make.top.equalToSuperview().offset(40)
            make.height.equalTo(131)
        })
        
        topBannerImage.snp.makeConstraints({ make in
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalTo(topBannerDesc)
            make.height.width.equalTo(100)
        })
        
        topBannerTitle.snp.makeConstraints({ make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(16)
        })
        
        topBannerDesc.snp.makeConstraints({ make in
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalTo(topBannerImage.snp.leading)
            make.top.equalTo(topBannerTitle.snp.bottom).offset(8)
        })
        
        topBannerbutton.snp.makeConstraints({ make in
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(32)
            make.width.equalTo(110)
            make.top.equalTo(topBannerDesc.snp.bottom).offset(16)
        })
        
        topBannerPageIndicator.snp.makeConstraints({ make in
            make.leading.equalTo(topBannerImage)
            make.width.equalTo(76)
            make.height.equalTo(8)
            make.bottom.equalToSuperview().inset(20)
        })
        
        scrollView.addSubview(secondBannerBackground)
        secondBannerBackground.addSubview(secondBannerTitle)
        secondBannerBackground.addSubview(secondBannerDesc)
        secondBannerBackground.addSubview(secondBannerImage)
        secondBannerBackground.addSubview(secondBannerButtonTitle)
        secondBannerBackground.addSubview(secondBannerButtonIcon)
        
        secondBannerBackground.snp.makeConstraints({ make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide ).inset(20)
            make.top.equalTo(topBannerBackground.snp.bottom).offset(48)
            make.height.equalTo(131)
        })
        
        secondBannerImage.snp.makeConstraints({ make in
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(secondBannerDesc)
            make.height.width.equalTo(100)
        })
        
        secondBannerTitle.snp.makeConstraints({ make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(16)
        })
        
        secondBannerDesc.snp.makeConstraints({ make in
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalTo(secondBannerImage.snp.leading)
            make.top.equalTo(secondBannerTitle.snp.bottom).offset(8)
        })
        
        secondBannerButtonTitle.snp.makeConstraints({ make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(secondBannerDesc.snp.bottom).offset(24)
        })
        
        secondBannerButtonIcon.snp.makeConstraints({ make in
            make.leading.equalTo(secondBannerButtonTitle.snp.trailing).offset(8)
            make.centerY.equalTo(secondBannerButtonTitle)
            make.height.width.equalTo(16)
        })
        
        scrollView.addSubview(lastBannerBackground)
        lastBannerBackground.addSubview(lastBannerTitle)
        lastBannerBackground.addSubview(lastBannerDesc)
        lastBannerBackground.addSubview(lastBannerImage)
        lastBannerBackground.addSubview(lastBannerButtonTitle)
        lastBannerBackground.addSubview(lastBannerButtonIcon)
        
        lastBannerBackground.snp.makeConstraints({ make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide ).inset(20)
            make.top.equalTo(secondBannerBackground.snp.bottom).offset(60)
            make.height.equalTo(104)
        })
        
        lastBannerImage.snp.makeConstraints({ make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalTo(lastBannerDesc)
            make.height.width.equalTo(100)
        })
        
        lastBannerTitle.snp.makeConstraints({ make in
            make.leading.equalTo(lastBannerImage.snp.trailing).offset(24)
            make.top.equalToSuperview().offset(12)
        })
        
        lastBannerDesc.snp.makeConstraints({ make in
            make.leading.equalTo(lastBannerImage.snp.trailing).offset(24)
            make.trailing.equalToSuperview().offset(20)
            make.top.equalTo(lastBannerTitle.snp.bottom).offset(8)
        })
        
        lastBannerButtonTitle.snp.makeConstraints({ make in
            make.leading.equalTo(lastBannerImage.snp.trailing).offset(24)
            make.top.equalTo(lastBannerDesc.snp.bottom).offset(12)
        })
        
        lastBannerButtonIcon.snp.makeConstraints({ make in
            make.leading.equalTo(lastBannerButtonTitle.snp.trailing).offset(8)
            make.centerY.equalTo(lastBannerButtonTitle)
            make.height.width.equalTo(16)
        })
        
        scrollView.addSubview(filterContainer)
        scrollView.addSubview(searchBar)
        filterContainer.addSubview(filterIcon)
        
        filterContainer.snp.makeConstraints({ make in
            make.centerY.equalTo(searchBar)
            make.leading.equalTo(lastBannerBackground)
            make.height.width.equalTo(40)
        })
        
        filterIcon.snp.makeConstraints({ make in
            make.center.equalToSuperview()
            make.height.width.equalTo(16)
        })
        
        searchBar.snp.makeConstraints({ make in
            make.top.equalTo(lastBannerBackground.snp.bottom).offset(32)
            make.trailing.equalTo(lastBannerBackground)
            make.leading.equalTo(filterContainer.snp.trailing).offset(30)
            make.width.equalTo(200)
            make.height.equalTo(40)
        })
        
        scrollView.addSubview(productView)
        productView.snp.makeConstraints({ make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
        })
        
        scrollView.addSubview(product1)
        scrollView.addSubview(product2)
        
        product1.snp.makeConstraints({ make in
            make.top.equalTo(productView.snp.bottom).offset(12)
            make.leading.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(200)
            make.width.equalTo(200)
           
        })
        
        product2.snp.makeConstraints({ make in
            make.top.equalTo(productView.snp.bottom).offset(12)
            make.leading.equalTo(product1.snp.trailing).offset(-20)
            make.height.equalTo(200)
            make.width.equalTo(200)
           
        })
        
        scrollView.addSubview(servicetypetitle)
        scrollView.addSubview(categoryServiceType)
        servicetypetitle.snp.makeConstraints({ make in
            make.top.equalTo(product1.snp.bottom).offset(12)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
        })
        
        categoryServiceType.snp.makeConstraints({ make in
            make.top.equalTo(servicetypetitle.snp.bottom).offset(12)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
        })
        
        // for mockups only please use tableview
        scrollView.addSubview(productservice1)
        scrollView.addSubview(productservice2)
        
        productservice1.snp.makeConstraints({ make in
            make.top.equalTo(categoryServiceType.snp.bottom).offset(12)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(170)
        })
        
        productservice2.snp.makeConstraints({ make in
            make.top.equalTo(productservice1.snp.bottom).offset(20)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(170)
            
        })
        scrollView.addSubview(bottomBar)
        bottomBar.snp.makeConstraints({ make in
            make.top.equalTo(productservice2.snp.bottom).offset(30)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
//            make.top.equalTo(container.snp.bottom).offset(-16)
            make.bottom.equalToSuperview()
            make.height.equalTo(110)
            
        })
        
        
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewPreview {
                HomeView()
            }
        }
    }
}
#endif
