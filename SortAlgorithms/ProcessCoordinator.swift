//
//  ProcessCoordinator.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 06.08.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import UIKit

protocol ProcessCoordinator {
    init(processStatus: String, processColor: UIColor)
    func setupProcessView(view: ProcessView)
    func start()
    func stop(text: String, color: UIColor, completion: (()->())?)
}
