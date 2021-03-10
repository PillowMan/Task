//
//  CallListTableViewModel.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 10.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import Foundation

protocol CallListTableViewModelProtocol {
    func fetchCallList(fromUrl url: String, completion: @escaping () -> Void)
    func getNumberOfCalls() -> Int
}
class CallListTableViewModel: CallListTableViewModelProtocol {
    
    let calls = [CallData]()
    
    func fetchCallList(fromUrl url: String, completion: @escaping () -> Void) {
        
        NetworkManager.shared.fetchContacts(fromUrl: url) { (callList) in
            
        }
        
    }
    
    func getNumberOfCalls() -> Int {
        return calls.count
    }
    
    
}
