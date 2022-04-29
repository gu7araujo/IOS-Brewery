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

    @State private var isShowingDetailView = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("Segundo a opinião dos usuários:")
                .font(.headline)
            Text("Exibindo \(results.count) resultados.")
                .font(.footnote)

            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(results, id: \.id) { result in
                        NavigationLink(destination: DetailsView(), isActive: $isShowingDetailView) {
                            EmptyView()
                        }

                        CardBrewery(brewery: result)
                            .onTapGesture {
                                isShowingDetailView = true
                            }
                    }
                }
            }
        }
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
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    RadialGradient(stops: [
                        .init(color: Color("Yellow"), location: 0.3),
                        .init(color: Color("WhiteBackground"), location: 0.3)
                    ], center: .top, startRadius: geometry.size.height * 0.1, endRadius: geometry.size.height * 1)
                        .ignoresSafeArea()

                    VStack {
                        VStack(alignment: .leading) {
                            Text("Bem vindo,\nEncontre as melhores cervejarias")
                                .font(.headline)

                            CustomTextField(text: $viewModel.searchText, placeholder: "Buscar local", systemImageName: "magnifyingglass")
                                .defaultLayoutTextField()
                        }
                        .frame(height: geometry.size.height * 0.3)

                        Spacer()

                        if viewModel.showingResult {
                            HomeSearchResults(results: viewModel.searchResult)
                                .padding(.top, 20)
                                .transition(.opacity)
                        } else {
                            Messages(title: viewModel.messageTitle, message: viewModel.messageBody)
                        }

                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .onAppear {
                guard viewModel.searchText.isEmpty else {
                    return
                }
                viewModel.searchEmpty()
            }
            .onSubmit {
                viewModel.onSubmit()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
