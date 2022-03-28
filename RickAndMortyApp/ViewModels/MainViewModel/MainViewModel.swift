//
//  MainViewModel.swift
//  RickAndMortyApp
//
//  Created by KirRealDev on 27.03.2022.
//

import Foundation

final class MainViewModel: MainViewModeling {
    var characterData = Dynamic([Character]())
    let networkManager = NetworkManager()
    
    func loadData() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.networkManager.performGetCharacterRequest(url: NetworkConstants.urlForLoadingListOfCharacters,
                onComplete: { [weak self] (data) in
                    self?.characterData.value = data.results
                },
                onError: { (error) in NSLog(error.localizedDescription)
                }
            )
        }
    }
}
