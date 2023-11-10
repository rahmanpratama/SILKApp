//
//  SilkNavigationBar.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/10/23.
//

import Foundation
import UIKit
import SnapKit

protocol SilkNavigationBarDelegate: AnyObject {
    func didPressMenu()
}

class SilkNavigationBar: UIView {
    
    weak var delegate: SilkNavigationBarDelegate?
    
    let headerImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "dashicons_menu")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let shopImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "shopping_cart")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let bellImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "bell")
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createView()
    }
    
    private func createView() {
        backgroundColor = .white
        
        addSubview(headerImage)
        addSubview(shopImage)
        addSubview(bellImage)
        
        headerImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        shopImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(bellImage.snp.leading).offset(-32)
            make.width.height.equalTo(22)
        }
        
        bellImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(30)
            make.width.height.equalTo(22)
        }
        
        headerImage.addTapGestureRecognizer(action: {
            self.delegate?.didPressMenu()
        })

    }
}
