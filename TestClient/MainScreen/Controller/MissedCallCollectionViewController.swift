//
//  MainScreenCollectionViewController.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 10.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import UIKit

enum ScreenType:String {case detail = "Detail"}
let missedCallLink = "https://5e3c202ef2cb300014391b5a.mockapi.io/testapi"

class MissedCallCollectionViewController: UICollectionViewController {
    
    var viewModel: MissedCallCollectionViewModelProtocol?
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.hidesBarsOnSwipe = true
        viewModel?.fetchCallList(fromUrl: missedCallLink){
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

   

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {return}
        viewModel.selectRow(for: indexPath)
        performSegue(withIdentifier: ScreenType.detail.rawValue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == ScreenType.detail.rawValue, let detailScreen = segue.destination as? DetailViewController, let viewModel = viewModel else {return}
        detailScreen.detailViewModel = viewModel.getDetailViewModel()
      
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return viewModel?.getNumberOfCalls() ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "missedCallCell", for: indexPath) as! MissedCallCollectionViewCell
        guard let viewModel = viewModel else {return cell}
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath)
    
        return cell
    }

    

}
