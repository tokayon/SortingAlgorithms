//
//  DetailViewController.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 22.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import UIKit


//MARK: - DetailViewController -
class DetailViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var processView: ProcessView!
    @IBOutlet weak var generateButton: UIButton!
    
    //Mark: Properties
    enum PickerType {
        case sizes
        case sorters
    }
    
    var pickerType: PickerType = .sizes
    var selectedSize = Constants.Sizes.ten
    var selectedType = Constants.Sorters.swift
    
    var processManager: ProcessViewManager? = nil

    let sizes = [Constants.Sizes.one,
                 Constants.Sizes.five,
                 Constants.Sizes.ten,
                 Constants.Sizes.fifty,
                 Constants.Sizes.hundred,
                 Constants.Sizes.fiveHundred,
                 Constants.Sizes.million,
                 Constants.Sizes.fiveMillion,
                 Constants.Sizes.tenMillion]
    
    let sorters = [Constants.Sorters.swift,
                   Constants.Sorters.bubble,
                   Constants.Sorters.selection,
                   Constants.Sorters.insertion,
                   Constants.Sorters.merge,
                   Constants.Sorters.quick,
                   Constants.Sorters.bucket]
    
    let sorterDescriptions = [Constants.SorterDescriptions.swiftDescription,
                              Constants.SorterDescriptions.bubbleDescription,
                              Constants.SorterDescriptions.selectionDescription,
                              Constants.SorterDescriptions.insertionDescription,
                              Constants.SorterDescriptions.mergeDescription,
                              Constants.SorterDescriptions.quickDescription,
                              Constants.SorterDescriptions.bucketDescription]

    
    //MARK: Life cycle
    override func viewDidLoad() {
        self.navigationItem.title = pickerType == .sizes ? Constants.Labels.sizeOfArray : Constants.Labels.typesOfSorting
        setupPicker()
        generateButton.isHidden = pickerType != .sizes
        processManager = ProcessViewManager(processStatus: "Generating", processColor: UIColor.customOrange)
        processManager?.setupProcessView(view: processView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let mainVC = self.parent?.childViewControllers[0] as? MainViewController {
            if mainVC.sizeOfArray != selectedSize || mainVC.typeOfSorting != selectedType {
                mainVC.resetClock()
            }
            mainVC.sizeOfArray = selectedSize
            mainVC.typeOfSorting = selectedType
        }
    }
    
    @IBAction func generate(_ sender: UIButton) {
        processManager?.start()
        Generator.generateArray(size: selectedSize.intValue) { (result) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { 
                self.processManager?.stop(text: "Generated", color: UIColor.customGreen, completion: nil)
            })
        }
    }
    
}

//MARK: - Common methods
extension DetailViewController {
    func setupPicker() {
        let pickerArray = pickerType == .sizes ? sizes : sorters
        let selectedTitle = pickerType == .sizes ? selectedSize : selectedType
        var selectedRow: Int = 0
        for (index, value) in pickerArray.enumerated() {
            if value == selectedTitle {
                selectedRow = index
            }
        }

        pickerView.selectRow(selectedRow, inComponent: 0, animated: false)
        updateDescription(row: selectedRow)
    }
    
    func updateDescription(row: Int) {
        if pickerType == .sizes {
            updateDescriptionWithSize(size: row)
        } else {
            updateDescriptionWithType(type: row)
        }
    }
    
    
    func updateDescriptionWithSize(size: Int) {
        let amount = sizes[size]
        let upper = sizes[size].intValue / 10
        let desc = "Unsorted array of \(amount) numbers\nfrom 1 to \(upper)"
        descriptionLabel.text = desc
    }
    
    func updateDescriptionWithType(type: Int) {
        descriptionLabel.text = sorterDescriptions[type]
    }
}

//MARK: UIPickerViewDelegate & UIPickerViewDataSource
extension DetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerType == .sizes ? sizes.count : sorters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerType == .sizes ? sizes[row] : sorters[row]
        let regularColor = UIColor.customWhite
        let font = UIFont(name: "Baskerville", size: 15)!
        let attributes = [NSAttributedStringKey.font : font,
                    NSAttributedStringKey.foregroundColor: regularColor]
        let attributed = NSAttributedString(string: titleData, attributes: attributes)
        return attributed
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
        updateDescription(row: row)
        if pickerType == .sizes {
            selectedSize = sizes[row]
        } else {
            selectedType = sorters[row]
        }
    }

}
