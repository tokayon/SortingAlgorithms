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
    
    
    //Mark: Properties
    enum PickerType {
        case sizes
        case sorters
    }
    
    var pickerType: PickerType = .sizes
    var selectedSize = Constants.Sizes.ten
    var selectedType = Constants.Sorters.quick
    
    let sizes = [Constants.Sizes.one,
                 Constants.Sizes.five,
                 Constants.Sizes.ten,
                 Constants.Sizes.fifty,
                 Constants.Sizes.hundred,
                 Constants.Sizes.fiveHundred,
                 Constants.Sizes.million,
                 Constants.Sizes.fiveMillion,
                 Constants.Sizes.tenMillion]
    
    let sorters = [Constants.Sorters.bubble,
                   Constants.Sorters.selection,
                   Constants.Sorters.insertion,
                   Constants.Sorters.merge,
                   Constants.Sorters.quick,
                   Constants.Sorters.bucket]
    
    let sorterDescriptions = [Constants.SorterDescriptions.bubbleDescription,
                              Constants.SorterDescriptions.selectionDescription,
                              Constants.SorterDescriptions.insertionDescription,
                              Constants.SorterDescriptions.mergeDescription,
                              Constants.SorterDescriptions.quickDescription,
                              Constants.SorterDescriptions.bucketDescription]

    
    //MARK: Life cycle
    override func viewDidLoad() {
        self.navigationItem.title = pickerType == .sizes ? Constants.Labels.sizeOfArray : Constants.Labels.typesOfSorting
        setupPicker()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let mainVC = self.parent?.childViewControllers[0] as? MainViewController {
            mainVC.sizeOfArray = selectedSize
            mainVC.typeOfSorting = selectedType
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
        let desc = "Unsorted array of \(amount) numbers\nfrom 1 to 100"
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
        let attributes = [NSFontAttributeName : font,
                    NSForegroundColorAttributeName: regularColor]
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
