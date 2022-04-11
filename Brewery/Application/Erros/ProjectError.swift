//
//  ProjectErros.swift
//  Application
//
//  Created by Gustavo Araujo Santos on 10/04/22.
//

import Foundation

public enum ProjectError: LocalizedError {
    case handleResponseError

    public var errorDescription: String? {
        switch self {
        case .handleResponseError:
            return "Algum deu errado com o carregamento, Tente mudar o termo pesquisado."
        }
    }
}
