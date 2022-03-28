//
//  Page.swift
//  RickAndMortyApp
//
//  Created by KirRealDev on 28.03.2022.
//

import Foundation

struct Page: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count, pages: Int
    let next: String
}
