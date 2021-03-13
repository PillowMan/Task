//
//  MissedCallCollectionViewModel.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 11.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import Foundation
import CoreData
protocol MissedCallCollectionViewModelProtocol {
    func fetchCallList(fromUrl url: String, completion: @escaping () -> Void)
    func getNumberOfCalls() -> Int
    func selectRow(for indexPath: IndexPath)
    func getDetailViewModel() -> DetailViewModelProtocol?
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MissedCallCollectionViewCellModelProtocol?
    
}
class MissedCallCollectionViewModel: MissedCallCollectionViewModelProtocol {
    
    var calls: [CallData]
    var indexPath:IndexPath?
    
    init(){
        calls = DataManager.shared.fetchCallList() ?? [CallData]()
    }
    
    func fetchCallList(fromUrl url: String, completion: @escaping () -> Void) {
        
        
        NetworkManager.shared.fetchMissedCalls(fromUrl: url) { (results) in
            
            switch results {
            case .success(let calls):
                let calls = calls.sorted { (v1, v2) -> Bool in
                    guard let firstDate = v1.created?.convertToDate(), let secondDate = v2.created?.convertToDate() else {return false}
                    return firstDate < secondDate
                }
                
                let dataMananger = DataManager.shared
                dataMananger.deleteAllData(from: "CallData")
                let context = dataMananger.persistentContainer.viewContext
                let entityConverter = EntityConverter(context: context)
                let callDataList = entityConverter.getCallDataList(from: calls)
                dataMananger.saveContext()
                self.calls = callDataList
            default: break
            }
            
           
            completion()
        }
        
    }
    
    
    func getNumberOfCalls() -> Int {
        return calls.count
    }
    
    func selectRow(for indexPath: IndexPath){
        self.indexPath = indexPath
    }
    
    func getDetailViewModel() -> DetailViewModelProtocol? {
        guard let indexPath = indexPath else {return nil}
        let callData = calls[indexPath.row]
        return DetailViewModel(missedCall: callData)
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MissedCallCollectionViewCellModelProtocol? {
        let callData = calls[indexPath.row]
        return MissedCallCollectionViewCellModel(callData: callData)
    }
    
    
}
