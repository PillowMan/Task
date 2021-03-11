//
//  MissedCallCollectionViewCellProtocol.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 11.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import Foundation
import CoreData

protocol MissedCallCollectionViewCellModelProtocol {
    var numberOfContact: String {get}
    var contactName: String {get}
    var missedCallDuration: String {get}
    var missedCallDate: String {get}
}

class MissedCallCollectionViewCellModel: MissedCallCollectionViewCellModelProtocol {
    
    private var callData: CallData
    
    var numberOfContact: String {
        return callData.businessNumber?.number ?? ""
    }
    
    var contactName: String {
        return callData.client?.name ?? ""
    }
    
    var missedCallDuration: String {
        guard let duration = callData.duration else {
            return "00:00"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm:ss"
        return dateFormatter.string(from: duration)
    }
    
    var missedCallDate: String {
        guard let createdDate = callData.created else {
            return "00:00"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter.string(from: createdDate)
    }
    
    init(callData: CallData){
        self.callData = callData
    }
}
