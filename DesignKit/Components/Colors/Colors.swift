//
//  Colors.swift
//  DesignKit
//
//  Created by Agus Cahyono on 16/12/20.
//

import SwiftUI

extension Color {
    
    static let acBackground = Color("background")
    static let acBasic = Color("basic")
    static let acPrimary = Color("primary")
    
    // MARK: Font Colors
    static let acFontStd = Color("font_std")
    static let acFontHint = Color("font_hint")
    static let acFontDisabled = Color("font_disabled")
    static let acFontBtn = Color("font_button")
    
    // MARK: Semantic Colors
    static let acDanger = Color("danger")
    static let acInfo = Color("info")
    static let acSuccess = Color("success")
    static let acWarning = Color("warning")
    
    // MARK: State Colors
    static let acActivePrimary = Color("activePrimary")
    static let acActiveBasic = Color("activeBasic")
    
}

struct Color_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack{
                Rectangle().size(CGSize(width: 50, height: 50))
                    .foregroundColor(.acBasic)
                Rectangle().size(CGSize(width: 50, height: 50))
                    .foregroundColor(.acPrimary)
                Rectangle().size(CGSize(width: 50, height: 50))
                    .foregroundColor(.acSuccess)
                Rectangle().size(CGSize(width: 50, height: 50))
                    .foregroundColor(.acInfo)
                Rectangle().size(CGSize(width: 50, height: 50))
                    .foregroundColor(.acWarning)
                Rectangle().size(CGSize(width: 50, height: 50))
                    .foregroundColor(.acDanger)
            }
            Text("Hello, World!")
                .foregroundColor(.acActivePrimary)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .background(Color.acActiveBasic)
                .environment(\.colorScheme, .dark)
        }
        .padding()
    }
}
