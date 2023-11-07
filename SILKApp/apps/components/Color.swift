//
//  Color.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import UIKit

struct Color {
    
    static let darkBlue = UIColor(string: "#002060")
    static let cyan = UIColor(string: "#00D9D5")
    
    
    
    static let green = UIColor(string: "#007025")
    static let lightgreen = UIColor(string: "#B3FFCB")
    
    static let orange = UIColor(string: "#FF7200")
   
    static let darkgray = UIColor(string: "#6A6A6A")
    static let gray = UIColor(string: "#597393")
    static let lightgray = UIColor(string: "#BEBEBE")
    
    static let cream = UIColor(string: "#F5EFE0")
    
    static let red = UIColor(string: "#EB0004")
    
    
   
}


extension UIColor {
    convenience init(string: String = "#FFFFFF") {
        var chars = Array(string.hasPrefix("#") ? "\(string.dropFirst())" : string)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 1
        switch chars.count {
        case 3:
            chars = [chars[0], chars[0], chars[1], chars[1], chars[2], chars[2]]
            fallthrough
        case 6:
            chars = ["F","F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            alpha = 0
        }
        self.init(red: red, green: green, blue:  blue, alpha: alpha)
    }
}
