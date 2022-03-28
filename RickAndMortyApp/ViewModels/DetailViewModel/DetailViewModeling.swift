//
//  DetailViewModeling.swift
//  RickAndMortyApp
//
//  Created by KirRealDev on 28.03.2022.
//

import Foundation

protocol DetailViewModeling {
    var characterData: Dynamic<Character> { get }
    func updateDataBy(value: Character)
}
