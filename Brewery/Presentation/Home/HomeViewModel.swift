//
//  HomeViewModel.swift
//  Brewery
//
//  Created by Gustavo Araujo Santos on 10/04/22.
//

import Application
import Domain
import Foundation

extension HomeView {
    @MainActor class HomeViewModel: ObservableObject {
        @Published var searchText = ""
        @Published var searchResult = [Brewery]()

        @Published var messageTitle = ""
        @Published var messageBody = ""


        func onSubmit() {
            guard !searchText.isEmpty else {
                searchEmpty()
                return
            }

            Task {
                guard let response = await BreweryUseCase.shared.execute(name: searchText) else {
                    messageTitle = "Erro"
                    messageBody = "Não foi possível buscar informações."
                    return
                }

                switch response {
                case .success(let breweries):
                    searchResult = breweries
                case .failure(let error):
                    messageTitle = "Erro"
                    messageBody = error.localizedDescription
                }
            }
        }


        func searchEmpty() {
            searchResult = []
            messageTitle = "Nenhum termo digitado"
            messageBody = "Por favor, verifique sua pesquisa e tente novamente para obter resultados"
        }

    }
}
