//
//  DetailsViewController.swift
//  Request Codable Alamofire
//
//  Created by Nikita Koniukh on 28/05/2020.
//  Copyright © 2020 Nikita Koniukh. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class DetailsViewController: UIViewController {

    // Outlets
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!


    // Properties
    var character: Character?

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    private func commonInit() {
        guard let character = character,
            let image = character.thumbnail
            else { return }

        characterNameLabel.text = character.name
        characterNameLabel.text =  characterNameLabel.text?.uppercased()

        if image.path == "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available" {
            characterImage.contentMode = .scaleToFill
        } else {
            characterImage.contentMode = .scaleAspectFill
        }
        characterImage.sd_setImage(with: image.url)
        characterDescriptionLabel.text = character.description
    }

}


//
//
//    func fetchList() {
//           guard let data = data else { return }
//
//        let request = AF.request(data.contributorsUrl!)
//
//        request.validate().responseDecodable(of: [Contributor].self) { response in
//            switch response.result {
//            case .failure(let err):
//                print(err.localizedDescription)
//            case .success(let contr):
//                print(contr)
//            }
//        }
//
//       }
//
//
//}
//
//extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return listData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
//        cell.textLabel?.text = listData[indexPath.row].login
//        return cell
//    }
//}

//extension DetailsViewController {
//    private func fetch<T: Codable>(_ url: String, of: T.Type) {
//        var items = [T]()
//
//        let fetchGroup = DispatchGroup()
//
//            fetchGroup.enter()
//            AF.request(url).validate().responseDecodable(of: T.self) { (response) in
//                if let value = response.value {
//                    items.append(value)
//                }
//                fetchGroup.leave()
//            }
//
//
//        fetchGroup.notify(queue: .main) {
//            self.listData = items as! [Contributor]
//            self.listTableView.reloadData()
//        }
//    }
//
//    func fetchList() {
//        guard let data = data else { return }
//
//        fetch(data.contributorsUrl!, of: [Contributor].self)
//
//    }
//}


