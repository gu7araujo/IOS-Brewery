//
//  ContentView.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 06/04/22.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 254/255, green: 204/255, blue: 0/255), location: 0.3),
                .init(color: Color(red: 1, green: 1, blue: 1), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 300)
                .ignoresSafeArea()

            VStack {
                VStack(alignment: .leading) {
                    Text("Bem vindo,\nEncontre as melhores cervejarias")
                        .font(.headline)

                    CustomTextField(text: $searchText, placeholder: "Buscar local", systemImageName: "magnifyingglass")
                        .defaultLayoutTextField()
                }

                Spacer()

                VStack {
                    Text("Nenhum termo digitado")
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding()

                    Text("Por favor, verifique sua pesquisa e tente novamente para obter resultados.")
                        .font(.subheadline)
                }

                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
