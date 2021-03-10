//
//  Contact.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 10.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct CallList: Codable {
    let list: [Call]
    enum CodingKeys: String, CodingKey {
        case list = "requests"
    }
}

// MARK: - Request
struct Call: Codable {
    let id, state: String?
    let client: Client?
    let type, created: String?
    let businessNumber: BusinessNumber?
    let origin: String?
    let favorite: Bool?
    let duration: String?
}

// MARK: - BusinessNumber
struct BusinessNumber: Codable {
    let number, label: String?
}

// MARK: - Client
struct Client: Codable {
    let address: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case address
        case name = "Name"
    }
}
