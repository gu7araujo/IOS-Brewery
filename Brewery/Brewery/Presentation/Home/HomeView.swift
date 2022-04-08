//
//  ContentView.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 06/04/22.
//

import SwiftUI

private struct Messages: View {
    var title: String
    var message: String

    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.semibold)
                .font(.title)
                .padding()

            Text(message)
                .font(.subheadline)
        }
    }
}

struct HomeView: View {
    @State private var searchText = ""
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color("Yellow"), location: 0.3),
                .init(color: Color("WhiteBackground"), location: 0.3)
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

                VStack(alignment: .leading) {
                    Text("Segundo a opinião dos usuários:")
                        .font(.headline)
                    Text("Exibindo 25 de 100 resultados.")
                        .font(.footnote)

                    HStack(spacing: 0) {
                        Spacer()

                        Image(systemName: "a.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.brown, Color("Orange"))

                        Spacer()

                        VStack(alignment: .leading) {
                            Text("Cervejaria A")
                                .font(.headline)
                            Text("Tipo")
                        }

                        Spacer()

                        HStack(alignment: .center, spacing: 3) {
                            Text("3,9")
                                .font(.caption)
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                        }

                        Spacer()
                    }
                    .padding(10)
                    .background(.white)
                    .cornerRadius(15)


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
