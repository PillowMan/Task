//
//  MissedCallScreenBuilder.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 11.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import UIKit

class MissedCallScreenBuilder: NSObject {

    @IBOutlet weak var viewController: UICollectionViewController!
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let viewController = viewController as? MissedCallCollectionViewController else {return}
        viewController.viewModel = MissedCallCollectionViewModel()
    }
}
