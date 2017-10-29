//
//  ProcessView.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 06.08.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import UIKit

class ProcessView: UIView {

    let dots = [Constants.Dots.zero, Constants.Dots.one, Constants.Dots.two, Constants.Dots.three]
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dotLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let view = Bundle.main.loadNibNamed("ProcessView", owner: self, options: nil)?[0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }
    
    func updateDotText() {
        if let text = dotLabel.text {
            dotLabel.text =
                text == dots[0] ? dots[1] :
                text == dots[1] ? dots[2] :
                text == dots[2] ? dots[3] : dots[0]
        } else {
            dotLabel.text = dots[0]
        }
    }
}
