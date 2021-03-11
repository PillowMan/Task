//
//  DetailViewModel.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 11.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import Foundation
protocol DetailViewModelProtocol{
    var missedCall: CallData {get}
    init(missedCall: CallData)
}

class DetailViewModel: DetailViewModelProtocol {
    
    var missedCall: CallData
    
    required init(missedCall: CallData){
        self.missedCall = missedCall
    }
    
    
}
