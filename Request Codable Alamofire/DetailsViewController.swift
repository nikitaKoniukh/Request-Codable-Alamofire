//
//  DetailsViewController.swift
//  Request Codable Alamofire
//
//  Created by Nikita Koniukh on 28/05/2020.
//  Copyright © 2020 Nikita Koniukh. All rights reserved.
//

import UIKit
import Alamofire

class DetailsViewController: UIViewController {

    // Outlets
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var repoLanguageLabel: UILabel!
    @IBOutlet weak var listTableView: UITableView!

    // Properties
//    var data: Repo?
//    var listData: [Contributor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//        listTableView.delegate = self
//        listTableView.dataSource = self
//        commonInit()
//        fetchList()
    }
}

//    private func commonInit() {
//        guard let data = data else { return }
//
//        repoNameLabel.text = data.name
//        repoDescriptionLabel.text = data.descr
//        repoLanguageLabel.text = data.language
//    }
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


