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
    @IBOutlet weak var heroCollectionView: UICollectionView!
    
    let viewModel = DashboardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Heroes"
        heroCollectionView.contentInsetAdjustmentBehavior = .never
        getHeroList()
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenSideMenuSegue" {
            let sideMenuNavController = segue.destination as! UISideMenuNavigationController
            let leftMenuViewController = sideMenuNavController.topViewController as! LeftMenuViewController
            leftMenuViewController.delegate = self as LeftMenuViewControllerDelegate
            leftMenuViewController.setMenuTitleList(with: viewModel.heroRoleList)
        }
    }
}

// MARK: - Private

extension DashboardViewController {
    func getHeroList() {
        viewModel.getHeroList() { error in
            if error == nil {
                self.heroCollectionView.isHidden = false
                self.heroCollectionView.reloadData()
            } else {
                let alert = UIAlertController.defaultAlert
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filteredHeroList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hero = viewModel.filteredHeroList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as! HeroCollectionViewCell
        cell.setupCell(hero:hero)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension DashboardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DashboardToDetailSegue", sender: self)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    var spacing: CGFloat {
        let minimumScreenWidth: CGFloat = 320
        let minimumSpacing: CGFloat = 4
        let width = UIScreen.main.bounds.width
        let ratio = width / minimumScreenWidth
        
        return minimumSpacing * ratio
    }
    
    var widthSize: CGFloat {
        let minimumScreenWidth: CGFloat = 320
        let minimumSize: CGFloat = 100
        let width = UIScreen.main.bounds.width
        let ratio = width / minimumScreenWidth
        
        return minimumSize * ratio
    }
    
    var heightSize: CGFloat { return 90 }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: widthSize, height: heightSize)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let columnSpacing = spacing
        let columnPerRow: CGFloat = 3
        let columnWidth: CGFloat = widthSize
        let topBottomInset: CGFloat = 20
        
        let width = UIScreen.main.bounds.width
        let sideInset = (width - (columnWidth * columnPerRow) - columnSpacing) / columnPerRow
        return UIEdgeInsets(top: topBottomInset, left: sideInset,
                            bottom: topBottomInset, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
}

// MARK: - LeftMenuViewControllerDelegate

extension DashboardViewController: LeftMenuViewControllerDelegate {
    func didTapMenu(title: String) {
        dismiss(animated: true) {
            self.viewModel.filterHeroList(with: title)
            self.heroCollectionView.reloadData()
            self.title = title
        }
    }
}

