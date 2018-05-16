//
//  VenuesViewController.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import UIKit

class VenuesViewController: UITableViewController {
    var presenter: VenuesPresenterInterface!
    var viewModel: VenuesViewModel = VenuesViewModel()
    @IBOutlet var shearchBarCotroller: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let getureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapped))
        self.view.addGestureRecognizer(getureRecognizer)
        self.presenter.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "VenuesCell", for: indexPath) as? VenueCell {
            cell.setup(with: viewModel.model(for: indexPath))
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells(for: section)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    @objc func didTapped(){
        view.endEditing(true)
    }
}

extension VenuesViewController: VenuesViewInterface {
    func realoadViewModel(model: VenuesViewModel) {
        viewModel = model
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    
    func showError(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.show(alert, sender: nil)
    }
}

extension VenuesViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.shearchVenues(with: searchBar.text)
    }
}
