//
//  FavoriteViewModel.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 22.02.2024.
//

import UIKit
import CoreData
import Signals

protocol FavoriteViewModelDelegate: AnyObject {
    func didUpdate(_ data: [Search])
}

final class FavoriteViewModel: NSObject {
    
    var repository: FavoriteRepository!
    var sectionSubjects: Array<HomePageSectionModel>?
    weak var delegate: FavoriteViewModelDelegate?
    let coreManager = CoreDataEntityManager.shared
    var isLoaded = false

    init(repository: FavoriteRepository!) {
        self.repository = repository
    }
    
    func fetchDataFromCoreData() {
        var searchArray = [Search]()
        self.sectionSubjects = []
        coreManager.configureEntity("Movies")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try coreManager.managedContext.fetch(fetchRequest) as! [NSManagedObject]
            if results.count > 0 {
                for result in results {
                    if let id = result.value(forKey: "id") as? String {
                        if let poster = result.value(forKey: "imageUrl") as? String {
                            searchArray.append(Search(title: "", year: "", imdbID: id, type: nil, poster: poster))
                        }
                    }
                }
                self.sectionSubjects?.append(.SearchMoviesSection(items: [.SearchMoviesItem(data: searchArray)]))
                self.delegate?.didUpdate(searchArray)
            }
        } catch {
            print("error")
        }
    }    
}
