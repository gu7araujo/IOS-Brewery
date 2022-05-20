//
//  SaveRatingUseCase.swift
//  Application
//
//  Created by Gustavo Araujo Santos on 20/05/22.
//

import Domain
import Infrastructure

public protocol SaveRatingUseCaseProtocol {
    func execute(rating: Rating) -> Result<Rating, Error>
}

public class SaveRatingUseCase: SaveRatingUseCaseProtocol {

    private let database: DatabaseProtocol

    // MARK: - Initialization

    public init(database: DatabaseProtocol = CoreDataBase.shared) {
        self.database = database
    }

    // MARK: - Public methods

    public func execute(rating: Rating) -> Result<Rating, Error> {
        let result = database.save(data: rating)

        switch result {
        case .success(let rating):
            return .success(rating)
        case .failure(let error):
            return .failure(error)
        }
    }
}
