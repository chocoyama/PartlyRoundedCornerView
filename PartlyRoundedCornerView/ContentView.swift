//
//  ContentView.swift
//  PartlyRoundedCornerView
//
//  Created by Takuya Yokoyama on 2020/01/28.
//  Copyright © 2020 Takuya Yokoyama. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "person")
            .resizable()
            .frame(width: 100, height: 100)
            .background(Color.red)
            .cornerRadius(20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
}

struct PartlyRoundedCornerView: UIViewRepresentable {
    let cornerRadius: CGFloat
    let maskedCorners: CACornerMask
    
    func makeUIView(context: UIViewRepresentableContext<PartlyRoundedCornerView>) -> UIView {
        let uiView = UIView()
        uiView.layer.cornerRadius = cornerRadius
        uiView.layer.maskedCorners = maskedCorners
        uiView.backgroundColor = .white
        return uiView
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PartlyRoundedCornerView>) {
    }
}


struct PartlyRoundedCornerModifier: ViewModifier {
    let cornerRadius: CGFloat
    let maskedCorners: CACornerMask
    
    func body(content: Content) -> some View {
        content.mask(PartlyRoundedCornerView(cornerRadius: self.cornerRadius,
                                             maskedCorners: self.maskedCorners))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, maskedCorners: CACornerMask) -> some View {
        self.modifier(PartlyRoundedCornerModifier(cornerRadius: radius,
                                                  maskedCorners: maskedCorners))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
