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

    private var database = SingletonCoreDataBase.shared.database

    // MARK: - Initialization

    public init() { }

    // MARK: - Public methods

    public func execute(rating: Rating) -> Result<Rating, Error> {
        database.save(rating)
        return .success(rating)
    }
}

public class SingletonCoreDataBase {
    private init() { }
    public static var shared = SingletonCoreDataBase()
    public let database = CoreDataBase<Rating>()
}
