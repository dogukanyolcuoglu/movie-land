//
//  Array+add.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import UIKit

extension Swift.Optional where Wrapped == Array<UIViewController> {
    
    mutating func add(element: Wrapped.Iterator.Element) {
        if self == nil {
            self = Array()
        }
        self?.append(element)
    }
    
}
