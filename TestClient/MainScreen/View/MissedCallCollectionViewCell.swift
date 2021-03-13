//
//  MissedCallCollectionViewCell.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 10.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import UIKit

class MissedCallCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var time: UILabel!
    
    var viewModel: MissedCallCollectionViewCellModelProtocol? {
        willSet (viewModel){
            guard let viewModel = viewModel else {return}
             name.text = viewModel.contactName
            number.text = viewModel.numberOfContact
            duration.text = viewModel.missedCallDuration
            time.text = viewModel.missedCallDate
            
        }
    }
    
    
    override func layoutSubviews() {
        configCell()
    }
    
    func configCell(){
        self.contentView.layer.cornerRadius = 20
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
    }
    
   
}
