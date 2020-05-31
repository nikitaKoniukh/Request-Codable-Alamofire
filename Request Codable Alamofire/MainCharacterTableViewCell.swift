//
//  MainCharacterTableViewCell.swift
//  Request Codable Alamofire
//
//  Created by Nikita Koniukh on 30/05/2020.
//  Copyright © 2020 Nikita Koniukh. All rights reserved.
//

import UIKit
import SDWebImage

class MainCharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var characterImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configCell(character: Character) {
        self.nameLabel.text = character.name
        self.descriptionLabel.text = character.description
        self.characterImageView.sd_setImage(with: character.thumbnail?.url)

        setupView(character: character)
    }


    private func setupView(character: Character) {
        if character.thumbnail?.path == "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available" {
            self.characterImageView.contentMode = .scaleToFill
        } else {
            self.characterImageView.contentMode = .scaleAspectFill
        }

        self.nameLabel.text =  self.nameLabel.text?.uppercased()
    }
}
