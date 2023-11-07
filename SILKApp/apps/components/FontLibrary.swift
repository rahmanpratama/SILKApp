//
//  FontLibrary.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import UIKit

extension UIFont {
    
    static func font(size: CGFloat, fontType: FontLibrary = FontLibrary.defaultStyle()) -> UIFont {
        return UIFont(name: fontType.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

enum FontLibrary: String {
    
    case gilroyBold = "Gilroy-Bold"
    case gilroySemibold = "Gilroy-Semibold"
    case gilroyMedium = "Gilroy-Medium"

    case proximaNovaRegular = "ProximaNova-Regular"
    case proximaNovaSemibold = "ProximaNova-Semibold"

    static func defaultStyle() -> FontLibrary {
        return .proximaNovaRegular
    }
}
