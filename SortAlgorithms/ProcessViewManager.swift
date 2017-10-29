//
//  ProcessViewManager.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 06.08.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import UIKit

class ProcessViewManager: NSObject, ProcessCoordinator {
    
    let updateTime: TimeInterval = 0.6
    var timer: EasyTimer = EasyTimer()

    var processView: ProcessView! {
        didSet {
            processView.isHidden = false
            processView.dotLabel.isHidden = true
            processView.statusLabel.text = initialStatus
            processView.statusLabel.textColor = initialColor
        }
    }
    
    var initialStatus: String = ""
    var initialColor: UIColor = UIColor.clear
    var processStatus: String = ""
    var processColor: UIColor = UIColor.clear
    
    required init(processStatus: String, processColor: UIColor) {
        self.processStatus = processStatus
        self.processColor = processColor
        
    }
    
    func start() {
        if let existingView = processView {
            existingView.isHidden = false
            existingView.dotLabel.isHidden = false
            existingView.dotLabel.textColor = processColor
            existingView.statusLabel.textColor = processColor
            showStatusLabel(text: processStatus, color: processColor)
            existingView.updateDotText()
            startDotTimer()
        }
    }
    
    func showStatusLabel(text: String, color: UIColor) {
        if let existingView = processView {
            existingView.isHidden = false
            existingView.statusLabel.textColor = color
            existingView.statusLabel.text = text
        }
    }
    
    func hideStatusLabel() {
        if let existingView = processView {
            existingView.isHidden = true
        }
    }
    
    func setupProcessView(view: ProcessView) {
        processView = view
    }
    
    func stop(text: String, color: UIColor, completion: (()->())?) {
        timer.stop()
        if let existingView = processView {
            existingView.dotLabel.isHidden = true
            existingView.statusLabel.text = text
            existingView.statusLabel.textColor = color
        }
    }
    
    func startDotTimer() {
        timer.start(updateTime, self, selector: #selector(updateView))
    }
    
    @objc func updateView() {
        if let existingView = processView {
            existingView.updateDotText()
        }
    }
    
}
