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
    @IBOutlet weak var startButton: UIButton!
    
    
    //MARK: Properties
    var sizeOfArray = Constants.Sizes.ten
    var typeOfSorting = Constants.Sorters.quick
    var generatingTimer: Timer? = nil
    var sortingTimer: Timer? = nil
    
    //AnimationLabels
    var timeLabel: UILabel? = nil
    var statusLabel: UILabel? = nil
    var dotLabel: UILabel? = nil
    
    let dots = [Constants.Dots.zero, Constants.Dots.one, Constants.Dots.two, Constants.Dots.three]
    
    enum Status: String {
        case ready = ""
        case generating = "Generating"
        case sorting = "Sorting"
        case sorted = "Sorted"
    }
    
    var processStatus: Status = .ready
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProcess(status: .ready)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        if processStatus == .ready {
            setupProcess(status: .generating)
        } else if processStatus == .generating || processStatus == .sorting {
            cancelProcess()
        }
    }
    
}

//MARK: - Animation -
extension MainViewController {
    
    func startGeneratingAnimation() {
        guard statusLabel != nil, generatingTimer == nil else { return }
        statusLabel?.textColor = UIColor.customOrange
        animateGeneratingLabel()
        generatingTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(animateGeneratingLabel), userInfo: nil, repeats: true)
    }
    
    func stopGeneratingAnimation() {
        guard statusLabel != nil else { return }
        statusLabel?.alpha = 1.0
        if generatingTimer != nil {
            generatingTimer?.invalidate()
            generatingTimer = nil
        }
    }
    
    func startSortingAnimation() {
        guard statusLabel != nil, dotLabel != nil, sortingTimer == nil else { return }
        statusLabel?.textColor = UIColor.customBlue
        dotLabel?.textColor = UIColor.customBlue
        dotLabel?.text = dots[0]
        dotLabel?.isHidden = false
        sortingTimer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(setupDotLabel), userInfo: nil, repeats: true)
    }
    
    func stopSortingAnimation() {
        guard statusLabel != nil, dotLabel != nil else { return }
        dotLabel?.isHidden = true
        if sortingTimer != nil {
            sortingTimer?.invalidate()
            sortingTimer = nil
        }
    }
    
    func animateGeneratingLabel() {
        statusLabel?.alpha = 1.0
        UIView.animate(withDuration: 0.5, animations: {
            self.statusLabel?.alpha = 0.3
        }) { (finished) in
            UIView.animate(withDuration: 0.5, animations: {
                self.statusLabel?.alpha = 1.0
            })
        }
    }
    
}

//MARK: - Common methods -
extension MainViewController {
    func setupProcess(status: Status) {
        processStatus = status
        
        let statusColor = status == .generating ? UIColor.customOrange : status == .sorting ? UIColor.customBlue : UIColor.customGreen

        print("Setup process with status:", status)
        if let statusLabel = statusLabel {
            statusLabel.text = processStatus.rawValue
            statusLabel.isHidden = status == .ready
            statusLabel.textColor = statusColor
        }
        
        
        startButton.isEnabled = processStatus != .sorted
        startButton.backgroundColor = statusColor
        var buttonTitle = Constants.Labels.start
        switch status {
        case .ready:
            break
        case .generating:
            buttonTitle = Constants.Labels.cancel
            startGeneratingAnimation()
            generateArray()
        case .sorting:
            buttonTitle = Constants.Labels.cancel
            startSortingAnimation()
            sortArray()
        case .sorted:
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                self.setupProcess(status: .ready)
            })
        }
        
        startButton.setTitle(buttonTitle, for: .normal)

    }
    
    func setupDotLabel() {
        guard let dotLabel = dotLabel, let text = dotLabel.text else { return }
        dotLabel.text =
            text == dots[0] ? dots[1] :
            text == dots[1] ? dots[2] :
            text == dots[2] ? dots[3] : dots[0]
    }
    
    func generateArray() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            guard self.processStatus == .generating else { return }
            self.stopGeneratingAnimation()
            self.setupProcess(status: .sorting)
        }
    }
    
    func sortArray() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            guard self.processStatus == .sorting else { return }
            self.stopSortingAnimation()
            self.setupProcess(status: .sorted)
        }
    }
    
    func cancelProcess() {
        print("Cancel")
        stopGeneratingAnimation()
        stopSortingAnimation()
        setupProcess(status: .ready)
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
            cell.dotLabel.text = dots[0]
            cell.statusLabel.text = processStatus.rawValue
            timeLabel = cell.timeLabel
            statusLabel = cell.statusLabel
            dotLabel = cell.dotLabel
            
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
