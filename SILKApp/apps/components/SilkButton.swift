//
//  silkButton.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import UIKit

class SilkButton : UIButton {
    
    let rightIcon: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "arrow_right")
        image.contentMode = .scaleAspectFit
        return image
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
        self.setHeight()
        self.backgroundColor = Color.darkBlue
        self.layer.cornerRadius = 8
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.font(size: 16, fontType: .gilroySemibold)
        self.addSubview(rightIcon)
        
        rightIcon.snp.makeConstraints({ make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        })
        rightIcon.isHidden = true
        self.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        self.addTarget(self, action: #selector(buttonReleased), for: [.touchCancel, .touchUpInside, .touchUpOutside, .touchDragExit])
    }
    
    @objc func buttonPressed() {
        self.backgroundColor = Color.darkBlue
        self.alpha = 0.4
    }
    
    @objc func buttonReleased() {
        self.backgroundColor = Color.darkBlue
        self.alpha = 1
    }
    
    func setHeight(_ height: CGFloat = 48) {
        self.snp.updateConstraints({ make in
            make.height.equalTo(height)
        })
    }
    
    func setRightIcon(icon: UIImage? = UIImage(named: "arrow_right")) {
        rightIcon.image = icon
        rightIcon.isHidden = false
    }
    

    
    func setTitleAlignLeft() {
        self.titleLabel?.snp.makeConstraints({ make in
            make.leading.equalToSuperview()
        })
    }
}
