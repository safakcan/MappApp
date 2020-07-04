//
//  DetailScreenViewController.swift
//  MapApp
//
//  Created by Safak Can Bas on 3.07.2020.
//  Copyright (c) 2020 canbas. All rights reserved.

import UIKit

class DetailScreenViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    var presenter: DetailScreenPresenterViewProtocol!
    var selectedLocationData: [LocationModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getLocationDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}
extension DetailScreenViewController: DetailScreenViewControllerProtocol {
    func configureSelectedLocation(selectedLocation: [LocationModel]) {
        self.selectedLocationData = selectedLocation
        listLocationDetails()
    }
    
    func listLocationDetails() {
//        self.tableView.separatorStyle = .none
        self.tableView.allowsSelection = false
        self.tableViewHeightConstraint.constant = tableView.contentSize.height

        self.tableView.reloadData()
        self.tableViewHeightConstraint.constant = tableView.contentSize.height
    }
}


extension DetailScreenViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return  selectedLocationData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailTableViewCell
        cell.nameLabel.text = self.selectedLocationData?[indexPath.row].name
        cell.viLabel.text = self.selectedLocationData?[indexPath.row].vicinity
        cell.configureCellUI()
        return cell
    }
}

