//
//  MainViewModeling.swift
//  RickAndMortyApp
//
//  Created by KirRealDev on 28.03.2022.
//

import Foundation

protocol MainViewModeling {
    var characterData: Dynamic<[Character]> { get }
    var networkManager: NetworkManager { get }
    
    func loadData()
}
