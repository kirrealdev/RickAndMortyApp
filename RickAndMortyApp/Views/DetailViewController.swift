//
//  DetailViewController.swift
//  RickAndMortyApp
//
//  Created by KirRealDev on 27.03.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var detailImageView: UIImageView!
    
    @IBOutlet private weak var characterNameLabel: UILabel!
    @IBOutlet private weak var characterGenderLabel: UILabel!
    @IBOutlet private weak var characterStatusLabel: UILabel!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.characterData.bind({ (data) in
            DispatchQueue.main.async {
                self.updateUI()
            }
        })
    }
    
    private func updateUI() {
        detailImageView.loadImageWithoutCache(by: viewModel.characterData.value.image)
        
        characterNameLabel.text = "Name: " + viewModel.characterData.value.name
        characterGenderLabel.text = "Gender: " + viewModel.characterData.value.gender
        characterStatusLabel.text = "Status: " + viewModel.characterData.value.status
    }
    

}
