//
//  CoreDataBase.swift
//  Infrastructure
//
//  Created by Gustavo Araujo Santos on 20/05/22.
//

import Foundation
import Domain

public protocol DatabaseProtocol {
    func save(data: Rating) -> Result<Rating, Error>
    func getSpecificByBreweryId(id: String) -> Result<Rating, Error>
}

public final class CoreDataBase: DatabaseProtocol {

    private var arrayData: [Rating] = []

    public static var shared: DatabaseProtocol = CoreDataBase()

    private init() { }

    public func save(data: Rating) -> Result<Rating, Error> {
        arrayData.append(data)
        return .success(data)
    }

    public func getSpecificByBreweryId(id: String) -> Result<Rating, Error> {
        if let element = arrayData.first(where: {$0.breweryId == id}) {
            return .success(element)
        } else {
            return .failure(DatabaseError.failureToGetElement)
        }
    }
}
