//
//  NetworkManagering.swift
//  RickAndMortyApp
//
//  Created by KirRealDev on 27.03.2022.
//

import Foundation

protocol NetworkManagering {
    func makeGetRequest(urlString: String) -> URLRequest?
    func performGetCharacterRequest(url: String, onComplete: @escaping (Page) -> Void, onError: @escaping (Error) -> Void)
}
