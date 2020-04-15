//
//  DashboardViewController.swift
//  Dotadex
//
//  Created by Rizki Dwi Putra on 15/04/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit
import SideMenu

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Heroes"
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenSideMenuSegue" {
            let sideMenuNavController = segue.destination as! UISideMenuNavigationController
            let leftMenuViewController = sideMenuNavController.topViewController as! LeftMenuViewController
            leftMenuViewController.delegate = self as LeftMenuViewControllerDelegate
        }
    }
}

extension DashboardViewController: LeftMenuViewControllerDelegate {
    func didTapMenu(title: String) {
        dismiss(animated: true) {
            self.title = title
        }
    }
}

