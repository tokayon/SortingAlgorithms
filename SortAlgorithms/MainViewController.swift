//
//  MainViewController.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 22.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import UIKit

//MARK: - Main View Controller -
class MainViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    var sizeOfArray = Constants.Sizes.ten
    var typeOfSorting = Constants.Sorters.quick
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
}


//MARK: - UITableViewDelegate & UITableViewDataSource -
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.Identifiers.details, sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 2:
            return 200
        default:
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0, 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.optionCell) as! OptionCell
            let title = indexPath.row == 0 ? Constants.Labels.sizeOfArray : Constants.Labels.typesOfSorting
            cell.optionTitle.text = title
            cell.optionSubtitle.text = indexPath.row == 0 ? sizeOfArray : typeOfSorting
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.statusCell) as! StatusCell
            return cell
        }
    }
    
}

//MARK: - Navigation -
extension MainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        
        if let indexPath = sender as? IndexPath, indexPath.row == 0 {
            detailVC.pickerType = .sizes
            detailVC.selectedSize = sizeOfArray
        } else if let indexPath = sender as? IndexPath, indexPath.row == 1 {
            detailVC.pickerType = .sorters
            detailVC.selectedType = typeOfSorting
        }
    }
}
