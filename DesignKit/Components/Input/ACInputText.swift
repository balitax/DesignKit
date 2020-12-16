//
//  ACInputText.swift
//  DesignKit
//
//  Created by Agus Cahyono on 16/12/20.
//

import SwiftUI

struct ACInputText: View {
    
    enum ACInputTextStyle {
        case primary, disabled, success, warning, danger, withicon
    }
    
    var style: ACInputTextStyle = .disabled
    var placeholder: String
    var textMessage: String? = nil
    var rightIcon: Image? = nil
    var leftIcon: Image? = nil
    var commit: ()->() = { }
    @State private var focused: Bool = false
    @State var input: String = ""
    
    // MAKR: - inits
    init(_ placeholder: String, style: ACInputTextStyle, textMessage: String? = nil, leftIcon: Image? = nil, rightIcon: Image? = nil,  onCommit: @escaping ()->() = { }) {
        self.placeholder = placeholder
        self.style = style
        self.commit = onCommit
        self.textMessage = textMessage
        
        if self.style == .withicon {
            self.leftIcon = leftIcon
            self.rightIcon = rightIcon
        }
        
    }
    
    var body: some View {
        switch style {
        case .primary: defaultStyle()
        case .disabled: disableStyle()
        case .warning: warningStyle()
        case .success: successStyle()
        case .danger: dangerStyle()
        case .withicon: withIconStyle()
        }
    }
    
    // MARK: DEFAULT / PRIMARY TEXT INPUT
    fileprivate func defaultStyle() -> some View {
        
        HStack {
            ZStack(alignment: .leading) {
                
                if input.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color.acFontHint)
                        .font(.custom("Helvetica Neue", size: 14))
                }
                
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit).foregroundColor(.acFontStd)
                .font(.callout)
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 16)
            .frame(height: 46)
        }
        .background(RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(Color.acBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 0)
                    .stroke(self.focused ? Color.acBasic : Color.acBasic.opacity(0.4), lineWidth: 1))
        .onAppear {
            self.input = ""
        }
    }
    
    // MARK: DISABLE TEXT INPUT
    fileprivate func disableStyle() -> some View {
        
        HStack {
            ZStack(alignment: .leading) {
                
                if input.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color.acFontHint)
                        .font(.custom("Helvetica Neue", size: 14))
                }
                
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit).foregroundColor(.acFontStd)
                .font(.callout)
                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 16)
            .frame(height: 46)
        }
        .background(RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(Color.acBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 0)
                    .stroke(self.focused ? Color.acBasic : Color.acBasic.opacity(0.4), lineWidth: 1))
        .onAppear {
            self.input = ""
        }
    }
    
    // MARK: WARNING TEXT INPUT
    fileprivate func warningStyle() -> some View {
        
        VStack(alignment: .leading) {
            
            LazyVStack {
                HStack {
                    ZStack(alignment: .leading) {
                        if input.isEmpty { Text(placeholder)
                            .foregroundColor(Color.acWarning)
                            .font(.custom("Helvetica Neue", size: 14))
                        }
                        
                        TextField("", text: $input, onEditingChanged: { editingChanged in
                            self.focused = editingChanged
                            print(editingChanged ? "TextField focused" : "TextField focus removed")
                        }, onCommit: commit).foregroundColor(.acWarning)
                        .font(.custom("Helvetica Neue", size: 14))
                    }
                    .padding(.leading, 16)
                    .frame(height: 46)
                    Image(systemName: "info.circle.fill").imageScale(.small).foregroundColor(.acWarning)
                        .padding(.trailing, 6)
                }
                .background(RoundedRectangle(cornerRadius: 0)
                                .foregroundColor(Color.acBasic.opacity(self.focused ? 0 : 0.1)))
                .overlay(RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.acWarning, lineWidth: 1))
            }
            
            if let message = textMessage, !message.isEmpty  {
                Text(message)
                    .foregroundColor(Color.acWarning)
                    .font(.custom("Helvetica Neue", size: 10))
                
            }
        }
    }
    
    // MARK: SUCCESS TEXT INPUT
    fileprivate func successStyle() -> some View {
        
        VStack(alignment: .leading) {
            
            LazyVStack {
                HStack {
                    ZStack(alignment: .leading) {
                        if input.isEmpty { Text(placeholder)
                            .foregroundColor(Color.acSuccess)
                            .font(.custom("Helvetica Neue", size: 14))
                        }
                        
                        TextField("", text: $input, onEditingChanged: { editingChanged in
                            self.focused = editingChanged
                            print(editingChanged ? "TextField focused" : "TextField focus removed")
                        }, onCommit: commit).foregroundColor(.acSuccess)
                        .font(.custom("Helvetica Neue", size: 14))
                    }
                    .padding(.leading, 16)
                    .frame(height: 46)
                    Image(systemName: "checkmark.circle.fill").imageScale(.small).foregroundColor(.acSuccess)
                        .padding(.trailing, 6)
                }
                .background(RoundedRectangle(cornerRadius: 0)
                                .foregroundColor(Color.acBasic.opacity(self.focused ? 0 : 0.1)))
                .overlay(RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.acSuccess, lineWidth: 1))
            }
        }
    }
    
    // MARK: DANGER TEXT INPUT
    fileprivate func dangerStyle() -> some View {
        
        VStack(alignment: .leading) {
            
            LazyVStack {
                HStack {
                    ZStack(alignment: .leading) {
                        if input.isEmpty { Text(placeholder)
                            .foregroundColor(Color.acDanger)
                            .font(.custom("Helvetica Neue", size: 14))
                        }
                        
                        TextField("", text: $input, onEditingChanged: { editingChanged in
                            self.focused = editingChanged
                            print(editingChanged ? "TextField focused" : "TextField focus removed")
                        }, onCommit: commit).foregroundColor(.acDanger)
                        .font(.custom("Helvetica Neue", size: 14))
                    }
                    .padding(.leading, 16)
                    .frame(height: 46)
                    Image(systemName: "info.circle.fill").imageScale(.small).foregroundColor(.acDanger)
                        .padding(.trailing, 6)
                }
                .background(RoundedRectangle(cornerRadius: 0)
                                .foregroundColor(Color.acBasic.opacity(self.focused ? 0 : 0.1)))
                .overlay(RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.acDanger, lineWidth: 1))
            }
            
            if let message = textMessage, !message.isEmpty  {
                Text(message)
                    .foregroundColor(Color.acDanger)
                    .font(.custom("Helvetica Neue", size: 10))
                
            }
        }
        
    }
    
    // MARK: RIGHT ICON TEXT INPUT
    fileprivate func withIconStyle() -> some View {
        
        VStack(alignment: .leading) {
            
            LazyVStack {
                HStack {
                    
                    if let getLeftIcon = leftIcon {
                        getLeftIcon.imageScale(.small).foregroundColor(.acFontStd)
                            .padding(.leading, 8)
                    }
                    
                    ZStack(alignment: .leading) {
                        
                        if input.isEmpty { Text(placeholder)
                            .foregroundColor(Color.acFontStd)
                            .font(.custom("Helvetica Neue", size: 14))
                        }
                        
                        TextField("", text: $input, onEditingChanged: { editingChanged in
                            self.focused = editingChanged
                            print(editingChanged ? "TextField focused" : "TextField focus removed")
                        }, onCommit: commit).foregroundColor(.acFontStd)
                        .font(.custom("Helvetica Neue", size: 14))
                    }
                    .padding(.leading, leftIcon == nil ? 16 : 0)
                    .frame(height: 46)
                    
                    if let getRightIcon = rightIcon {
                        getRightIcon.imageScale(.small).foregroundColor(.acFontStd)
                            .padding(.trailing, 6)
                    }
                    
                }
                .background(RoundedRectangle(cornerRadius: 0)
                                .foregroundColor(Color.acBasic.opacity(self.focused ? 0 : 0.1)))
                .overlay(RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.acFontStd, lineWidth: 1))
            }
        }
    }
    
    
}

struct ACInputText_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                ACInputText("Your Placeholder", style: .primary)
                ACInputText("Disable Placeholder", style: .disabled)
                ACInputText("Warning Placeholder", style: .warning, textMessage: "Your warning message can defined here (Optional)")
                ACInputText("Warning Placeholder", style: .success)
                ACInputText("Warning Placeholder", style: .danger, textMessage: "Your danger / error message can defined here (Optional)")
                ACInputText("Warning Placeholder", style: .withicon, leftIcon: Image(systemName: "person.circle.fill"), rightIcon: Image(systemName: "checkmark.shield.fill"))
            }
            .navigationBarTitle("ACInputText", displayMode: .inline)
        }
    }
}
