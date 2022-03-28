//
//  DetailViewModel.swift
//  RickAndMortyApp
//
//  Created by KirRealDev on 28.03.2022.
//

import Foundation

final class DetailViewModel: DetailViewModeling {
    var characterData = Dynamic(Character.init(id: 0, name: "", status: "", species: "", type: "", gender: "", origin: Location.init(name: "", type: "", url: ""), location: Location.init(name: "", type: "", url: ""), image: "", episode: [String](), url: "", created: ""))
    
    func updateDataBy(value: Character) {
        characterData.value = value
    }
    
}
