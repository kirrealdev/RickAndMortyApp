//
//  CharacterTableViewCell.swift
//  RickAndMortyApp
//
//  Created by KirRealDev on 27.03.2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        characterImageView.layer.cornerRadius = characterImageView.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(name: String, imageURL: String) {
        characterNameLabel.text = name
        characterImageView.loadImageWithCache(by: imageURL, onComplete: { [weak self] (data, url) in
            if(imageURL == url) {
                self?.characterImageView.image = UIImage(data: data)
            }
        })
    }
    
}
