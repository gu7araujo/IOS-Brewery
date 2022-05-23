//
//  CoreDataBase.swift
//  Infrastructure
//
//  Created by Gustavo Araujo Santos on 20/05/22.
//

import Foundation

public protocol DatabaseProtocol {
    associatedtype Model
    func save(_ element: Model)
    func getSpecific(id: String, filter: (Model) throws -> Bool) -> Result<Model, Error>
}

public final class CoreDataBase<T>: DatabaseProtocol {
    private var arrayData: [T] = []

    public init() { }

    public func save(_ element: T) {
        arrayData.append(element)
    }

    public func getSpecific(id: String, filter: (T) throws -> Bool) -> Result<T, Error> {
        do {
            if let element = try arrayData.first(where: filter) {
                return .success(element)
            } else {
                return .failure(DatabaseError.notContainRating)
            }
        } catch {
            return .failure(DatabaseError.notContainRating)
        }
    }
}
