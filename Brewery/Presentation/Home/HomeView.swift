//
//  ContentView.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 06/04/22.
//

import SwiftUI
import Domain

private struct HomeSearchResults: View {
    var results: [Brewery]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Segundo a opinião dos usuários:")
                .font(.headline)
            Text("Exibindo \(results.count) resultados.")
                .font(.footnote)

            ScrollView {
                LazyVStack {
                    ForEach(results, id: \.id) { result in
                        HStack(spacing: 0) {
                            Spacer()

                            Image(systemName: "\(getFirstLetter(result.name)).circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(.brown, Color("Orange"))

                            Spacer()

                            VStack(alignment: .leading) {
                                Text(result.name)
                                    .font(.headline)
                                Text("Tipo \(result.breweryType)")
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
                        .onTapGesture {
                            print(result.name)
                        }
                        .padding(10)
                        .background(.white)
                        .cornerRadius(15)
                    }
                }
            }
        }
    }

    private func getFirstLetter(_ word: String) -> String {
        let letters = Array(word)
        return String(letters[0]).lowercased()
    }
}

private struct Messages: View {
    var title: String
    var message: String

    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.semibold)
                .font(.title)

            Text(message)
                .font(.subheadline)
        }
    }
}

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

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

                    CustomTextField(text: $viewModel.searchText, placeholder: "Buscar local", systemImageName: "magnifyingglass")
                        .defaultLayoutTextField()
                }.padding(.top, 30)

                Spacer()

                if viewModel.showingResult {
                    HomeSearchResults(results: viewModel.searchResult)
                        .padding(.top, 90)
                        .transition(.opacity)
                } else {
                    Messages(title: viewModel.messageTitle, message: viewModel.messageBody)
                }

                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .onAppear {
            viewModel.searchEmpty()
        }
        .onSubmit {
            viewModel.onSubmit()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
