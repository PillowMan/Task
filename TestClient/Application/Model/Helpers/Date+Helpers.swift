//
//  File.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 11.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import Foundation
extension Date {
    func getStringHours() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:ss"
        return dateFormatter.string(from: self)
    }
}
