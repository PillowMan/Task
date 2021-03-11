//
//  EntityConverter.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 10.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import Foundation
import CoreData
class EntityConverter {
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    func getCallDataList(from calls: [Call]) -> [CallData] {
        
        
        var callDataList = [CallData]()
        calls.forEach { (call) in
            let callData = CallData(context: context)
            callData.id = call.id
            callData.created = call.created?.convertToDate()
            callData.type = call.type
            callData.origin = call.origin
            callData.favorite = call.favorite ?? false
            
            callData.duration = call.duration?.convertTimeToDate()
            
            
            
            if let businessNumber = call.businessNumber {
                let businessNumberData = BusinessNumberData(context: context)
                businessNumberData.label = businessNumber.label
                businessNumberData.number = businessNumber.number
                callData.businessNumber = businessNumberData
            }
            
            if let client = call.client {
                let clientData = ClientData(context: context)
                clientData.name = client.name
                clientData.address = client.address
                callData.client = clientData
            }
            callDataList.append(callData)
        }
        
        return callDataList
    }
    
}
