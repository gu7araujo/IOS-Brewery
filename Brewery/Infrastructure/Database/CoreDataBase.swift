//
//  CoreDataBase.swift
//  Infrastructure
//
//  Created by Gustavo Araujo Santos on 20/05/22.
//

import Foundation
import Domain

public protocol DatabaseProtocol {
    func saveRating(_ element: Rating) -> Result<Rating, Error>
    func getSpecificRatingByBreweryId(id: String) -> Result<Rating, Error>
}

public final class CoreDataBase: DatabaseProtocol {

    private var arrayData: [Rating] = []

    public static var shared = CoreDataBase()

    private init() { }

    public func saveRating(_ element: Rating) -> Result<Rating, Error> {
        arrayData.append(element)
        return .success(element)
    }

    public func getSpecificRatingByBreweryId(id: String) -> Result<Rating, Error> {
        if let element = arrayData.first(where: {$0.breweryId == id}) {
            return .success(element)
        } else {
            return .failure(DatabaseError.notContainRating)
        }
    }
}
