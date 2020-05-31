//
//  ViewController.swift
//  Request Codable Alamofire
//
//  Created by Nikita Koniukh on 28/05/2020.
//  Copyright © 2020 Nikita Koniukh. All rights reserved.
//


import UIKit
import Alamofire

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    let repoService = RepoService()
    
    var characters = [Character]()
//    var items: [MyRepo] = []
//    var selectedItem: MyRepo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // searchBar.delegate = self

        repoService.fetchFilms { charactersResult in
            switch charactersResult {
            case .failure(let err):
                print(err.localizedDescription)
            case.success(let characters):
                self.characters = characters
                print(characters.count)
                self.tableView.reloadData()
            }
        }
    }

//    func getContributers(with stringUrl: String) -> Contributors {
//        repoService.fetchContributors(with: stringUrl) { (res) in
//            print(res)
//        }
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? DetailsViewController else { return }
        //destinationVC.data = selectedItem
        
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCellId", for: indexPath) as! MainCharacterTableViewCell
        let item = characters[indexPath.row]
        cell.configCell(character: item)
        

        return cell
    }

//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        selectedItem = items[indexPath.row]
//        return indexPath
//    }


}

//// MARK: - UISearchBarDelegate
//extension MainViewController: UISearchBarDelegate {
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        searchBar.showsCancelButton = true
//        guard let shipName = searchBar.text else { return }
//        searchShip(for: shipName)
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.text = ""
//        items = films
//        tableView.reloadData()
//        searchBar.showsCancelButton = false
//    }
//
//}
