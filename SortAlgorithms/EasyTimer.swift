//
//  EasyTimer.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 31.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation
import UIKit

class EasyTimer: NSObject {
    
    var timer: Timer? = nil
    
    func start(_ timeInterval: TimeInterval, _ controller: NSObject, selector: Selector) {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: controller, selector: selector, userInfo: nil, repeats: true)
    }
    
    func stop() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
}
