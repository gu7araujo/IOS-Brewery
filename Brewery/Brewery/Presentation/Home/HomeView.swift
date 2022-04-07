//
//  ContentView.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 06/04/22.
//

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

struct HomeView: View {
    @State private var searchText = ""
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 254/255, green: 204/255, blue: 0/255), location: 0.3),
                .init(color: Color(red: 1, green: 1, blue: 1), location: 0.3)
            ], center: .top, startRadius: 100, endRadius: 400)
                .ignoresSafeArea()

            VStack {
                Text("Bem vindo,\nEncontre as melhores cervejarias")
                    .font(.headline)

                CustomTextField(text: $searchText, placeholder: "Nome da cidade", systemImageName: "magnifyingglass")
                    .defaultLayoutTextField()


                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
