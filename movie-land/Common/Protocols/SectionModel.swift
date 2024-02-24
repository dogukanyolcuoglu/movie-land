//
//  SectionModel.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 24.02.2024.
//

import Foundation

public protocol SectionModelType {
    associatedtype Item

    var items: [Item] { get }

    init(original: Self, items: [Item])
}
