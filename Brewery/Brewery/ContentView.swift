//
//  ContentView.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 06/04/22.
//

import SwiftUI

struct ContentView: View {
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

                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    TextField("Nome da Cidade", text: $searchText)
                }
                    .padding(10)
                    .background(.white)
                    .cornerRadius(5)
                    .padding(.horizontal)

                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
