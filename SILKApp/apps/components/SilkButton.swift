//
//  silkButton.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import UIKit

class SilkButton : UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    func setupView() {
        self.setHeight(48)
        self.backgroundColor = Color.darkBlue
        self.layer.cornerRadius = 8
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.font(size: 16, fontType: .gilroySemibold)
        
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
    
    func setHeight(_ height: CGFloat) {
        self.snp.updateConstraints({ make in
            make.height.equalTo(height)
        })
    }
}
