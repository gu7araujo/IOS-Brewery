//
//  CustomTextField.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 07/04/22.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: String
    let systemImageName: String

    var body: some View {
        ZStack {
            HStack {
                Image(systemName: systemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                TextField(placeholder, text: $text)
            }
        }
    }
}

struct DefaultCustomTextFieldLayout: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(.white)
            .cornerRadius(5)
            .padding(.horizontal)
    }
}

extension View {
    func defaultLayoutTextField() -> some View {
        modifier(DefaultCustomTextFieldLayout())
    }
}
