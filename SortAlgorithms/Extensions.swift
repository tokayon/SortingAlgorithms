//
//  Extensions.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 24.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import UIKit

extension String {
    var intValue: Int {
        if let number = Int(self.replacingOccurrences(of: "_", with: "")) {
            return number
        } else {
            return 0
        }
    }
}

//MARK: UIColor extension
extension UIColor {
    
    static var customWhite: UIColor {
        get { return getColorWith(red: 241, green: 241, blue: 241, alpha: 0.9) }
    }

    
    static var customGreen: UIColor {
        get { return getColorWith(red: 43, green: 138, blue: 64, alpha: 1) }
    }
    
    static var customOrange: UIColor {
        get { return getColorWith(red: 208, green: 75, blue: 39, alpha: 1) }
    }
    
    static var customBlue: UIColor {
        get { return getColorWith(red: 1, green: 162, blue: 216, alpha: 1) }
    }
    
    static var customYellow: UIColor {
        get { return getColorWith(red: 216, green: 170, blue: 1, alpha: 1) }
    }
    
}

fileprivate func getColorWith(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
}
