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
    @IBOutlet weak var comicsAvailableLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var storiesAviableLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        self.nameLabel.text =  self.nameLabel.text?.uppercased()
    }

    func configCell(character: Character) {

        self.nameLabel.text = character.name
        self.characterImageView.sd_setImage(with: character.thumbnail?.url)

        setupImage(character: character)
        setupComicsCount(character: character)
        setupStoriesCount(character: character)
    }

    private func setupStoriesCount(character: Character) {
        if character.stories?.available == 0 {
            self.storiesAviableLable.text = "Stories not found"
        } else {
            self.storiesAviableLable.text = "\(character.stories?.available ?? 0) stories"
        }
    }

    private func setupComicsCount(character: Character) {
        if character.comics?.available == 0 {
            self.comicsAvailableLabel.text = "Comics not found"
        } else {
            self.comicsAvailableLabel.text = "\(character.comics?.available ?? 0) comics"
        }
    }


    private func setupImage(character: Character) {
        if character.thumbnail?.path == "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available" {
            self.characterImageView.contentMode = .scaleToFill
        } else {
            self.characterImageView.contentMode = .scaleAspectFill
        }
    }
}
