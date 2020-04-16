//
//  LeftMenuViewController.swift
//  Dotadex
//
//  Created by Rizki Dwi Putra on 15/04/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

protocol LeftMenuViewControllerDelegate: class {
    func didTapMenu(title: String)
}

class LeftMenuViewController: UIViewController {
    @IBOutlet weak var menuTableView: UITableView!
//    let menuTitleList = ["All Heroes","Carry", "Disabler", "Lane Support", "Initiator",
//                         "Jungler", "Support", "Durable", "Nuker", "Pusher", "Escape"]
    var menuTitleList = ["All Heroes"]
    weak var delegate: LeftMenuViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuTableView.contentInsetAdjustmentBehavior = .never
        menuTableView.tableFooterView = UIView()
    }
    
    func setMenuTitleList(with roles: [String]) {
        menuTitleList.append(contentsOf: roles)
    }
}

extension LeftMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell")
        if cell == nil  {
            cell = UITableViewCell(style: .default, reuseIdentifier: "DefaultCell")
        }
     
        cell.textLabel?.text = menuTitleList[indexPath.row]
     
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedMenuTitle = menuTitleList[indexPath.row]
        self.delegate?.didTapMenu(title: selectedMenuTitle)
    }
}
