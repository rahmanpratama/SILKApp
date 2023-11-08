//
//  UIViewPreview.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIViewPreview: UIViewRepresentable {
    typealias UIViewType = UIView
    
    let uiView: UIView
    
    init(_ builder: @escaping () -> UIView) {
        uiView = builder()
    }
    
    func makeUIView(context: Context) -> UIView {
        return uiView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
#endif
