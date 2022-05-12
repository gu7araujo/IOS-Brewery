//
//  ContentView.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 06/04/22.
//

import SwiftUI
import Domain

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Bem vindo,\nEncontre as melhores cervejarias")
                        .font(.headline)

                    TextField("Buscar local", text: $viewModel.searchText)
                }
                Spacer()

                if viewModel.showingResult {
                    VStack(alignment: .leading) {
                        Text("Segundo a opinião dos usuários:")
                        Text("Exibindo \(viewModel.searchResult.count) resultados.")
                            .font(.footnote)

                        ScrollView(showsIndicators: false) {
                            LazyVStack {
                                ForEach(viewModel.searchResult, id: \.id) { result in
                                    NavigationLink {
                                        DetailsView(brewery: result)
                                    } label: {
                                        HStack {
                                            Image(systemName: "\(result.name.getFirstLetter()).circle.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 40.0, height: 40.0)
                                                .foregroundStyle(.brown, Color("Orange"))
                                            Text(result.name)
                                                .font(.headline)
                                            Text("Tipo \(result.breweryType)")
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    Messages(title: viewModel.messageTitle, message: viewModel.messageBody)
                }
                Spacer()
            }
            .padding(.horizontal)
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
