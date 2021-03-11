//
//  DetailViewModel.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 11.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import Foundation
protocol DetailViewModelProtocol{
    var nameOfContact: String {get}
    var contactNumber: String {get}
    var duration: String  {get}
    var businessNumberName: String  {get}
    var businessNumber: String  {get}
    var missedCall: CallData {get}
    init(missedCall: CallData)
}

class DetailViewModel: DetailViewModelProtocol {
    
    
    
    var missedCall: CallData
    
    var nameOfContact: String {return missedCall.client?.name ?? ""}
    
    var contactNumber: String {return missedCall.client?.address ?? ""}
    
    var duration: String {return missedCall.duration?.getStringHours() ?? ""}
    
    var businessNumberName: String {return missedCall.businessNumber?.label ?? ""}
    
    var businessNumber: String {return missedCall.businessNumber?.number ?? ""}
    
    required init(missedCall: CallData){
        self.missedCall = missedCall
    }
    
    
}
