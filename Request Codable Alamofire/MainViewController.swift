//
//  ViewController.swift
//  Request Codable Alamofire
//
//  Created by Nikita Koniukh on 28/05/2020.
//  Copyright © 2020 Nikita Koniukh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!

    // MARK:- Properties
    private let repoService = RepoService()
    private var characters = [Character]()
    private var selectedItem: Character?
    private let searchBarIsHidden = false

    // MARK:- Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
        fetchCharacters(name: "")
    }

    // MARK:- Private functions
    private func fetchCharacters(name: String) {
        repoService.fetchFilms(nameStarts: name) { charactersResult in
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

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupSearchBar() {
        searchBar.delegate = self
        let searchTextAppearance = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        searchTextAppearance.textColor = .red
    }

    private func isRowZeroVisible() -> Bool {
        if let indexes = tableView.indexPathsForVisibleRows {
            for index in indexes {
                if index.row == 0 {
                    UIView.animate(withDuration: 0.2) {
                        self.searchBarHeightConstraint.constant = 54
                        self.tableViewHeightConstraint.constant = 56
                        self.view.layoutIfNeeded()
                    }
                    return false
                }
            }
        }
        UIView.animate(withDuration: 0.2) {
            self.searchBarHeightConstraint.constant = 0
            self.tableViewHeightConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        return true
    }

    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? DetailsViewController else { return }
        destinationVC.character = selectedItem
        
    }
}
// MARK:- Table View
extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCellId", for: indexPath) as! MainCharacterTableViewCell
        _ = isRowZeroVisible()
        let item = characters[indexPath.row]
        cell.configCell(character: item)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedItem = characters[indexPath.row]
        return indexPath
    }
}

// MARK: - UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        if let text = searchBar.text {
            fetchCharacters(name: text)
            searchBar.resignFirstResponder()
        }
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        fetchCharacters(name: "")
        tableView.reloadData()
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }
}
