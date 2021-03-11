//
//  DetailViewController.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 11.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameOfContact: UILabel!
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var businessNumberName: UILabel!
    @IBOutlet weak var businessNumber: UILabel!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var callImage: UIImageView!
    @IBOutlet weak var businessInfoStackView: UIStackView!
    @IBOutlet weak var businessInfoLabel: UILabel!
    
    lazy var heightConstraintContactView = contactView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 200)
    
    var detailViewModel: DetailViewModelProtocol!
    
    var detailInfoShown = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.setHidesBackButton(true, animated: true)
        configContactView()
        configCallImage()
        // Do any additional setup after loading the view.
    }
    
    private func configCallImage() {
        callImage.layer.borderWidth = 0.0
        callImage.layer.shadowColor = UIColor.black.cgColor
        callImage.layer.shadowOffset = CGSize(width: 0, height: 0)
        callImage.layer.shadowRadius = 5.0
        callImage.layer.shadowOpacity = 0.1
        callImage.layer.masksToBounds = false
    }
    
    private func configContactView(){
        contactView.layer.cornerRadius = 25
        contactView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        contactView.layer.borderWidth = 0.0
        contactView.layer.shadowColor = UIColor.black.cgColor
        contactView.layer.shadowOffset = CGSize(width: 0, height: 10)
        contactView.layer.shadowRadius = 5.0
        contactView.layer.shadowOpacity = 0.1
        contactView.layer.masksToBounds = false
        contactView.translatesAutoresizingMaskIntoConstraints = false
        contactView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        contactView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        contactView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        heightConstraintContactView.isActive = true
    }
    
    @IBAction func swipeTapped(_ sender: UIButton) {
        
        if detailInfoShown {
            self.businessInfoLabel.isHidden = true
            self.businessInfoStackView.isHidden = true
        }
        self.heightConstraintContactView.constant = self.heightConstraintContactView.constant == 200 ? 120 : 200
        UIView.animate(withDuration: 1) {
            
            self.view.layoutIfNeeded()
        } completion: { (finished) in
            if !self.detailInfoShown {
                self.businessInfoLabel.isHidden = false
                self.businessInfoStackView.isHidden = false
            }
            self.detailInfoShown = !self.detailInfoShown
            
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
