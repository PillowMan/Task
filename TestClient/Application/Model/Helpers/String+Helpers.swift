//
//  String+Helpers.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 10.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import Foundation

extension String {
    func convertToDate() -> Date?{
        let dateFormatter = DateFormatter()
        return dateFormatter.date(from: self)
    }
    
    func convertTimeToDate(_ time: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        return dateFormatter.date(from: self)
    }
}
