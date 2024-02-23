//
//  ProfileViewModel.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 22.02.2024.
//

import Foundation


final class ProfileViewModel: NSObject {
    
    var repository: ProfileRepository!
    
    init(repository: ProfileRepository!) {
        self.repository = repository
    }
    
}
