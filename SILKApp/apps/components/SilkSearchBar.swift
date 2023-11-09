//
//  SilkSearchBar.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/9/23.
//

import Foundation


class SilkSearchBar: UIView {
    
    let searchField: UITextField = {
       let textfield = UITextField()
        textfield.font = UIFont.font(size: 16, fontType: .proximaNovaRegular)
        textfield.textColor = Color.darkBlue
        textfield.placeholder = "Search"
        return textfield
    }()
    
    let searchContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setShadow()
        view.layer.cornerRadius = 20
        return view
    }()
    
    let searchIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "search_icon_blue")
        view.contentMode = .scaleAspectFit
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
//        backgroundColor = .cyan
        
        addSubview(searchContainer)
        searchContainer.addSubview(searchField)
        searchContainer.addSubview(searchIcon)
        
        searchContainer.snp.makeConstraints({ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        })
        
        searchField.snp.makeConstraints({ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        })
        
        searchIcon.snp.makeConstraints({ make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(16)
            make.width.equalTo(16)
        })
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SilkSearchBar_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewPreview {
                SilkSearchBar()
            }
        }
    }
}
#endif


    


