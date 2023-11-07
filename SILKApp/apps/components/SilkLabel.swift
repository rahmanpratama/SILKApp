//
//  SilkLabel.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation

import UIKit

class SilkLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStyle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
    }
    
    func setStyle(font: FontLibrary = .proximaNovaRegular, size: CGFloat = 16, color: UIColor = .black) {
        self.font = UIFont.font(size: size, fontType: font)
        self.textColor = color
    }
}
