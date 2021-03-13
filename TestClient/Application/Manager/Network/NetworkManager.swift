//
//  NetworkManager.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 10.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import Foundation

protocol NetworkProtocol: class {
    typealias MissedCallsData = Result<[Call], Error>
    func fetchMissedCalls(fromUrl url: String, completion: @escaping (MissedCallsData) -> Void)
}

class NetworkManager: NetworkProtocol {
    
    public static var shared = NetworkManager()
    private init(){}
    
    func fetchMissedCalls(fromUrl url: String, completion: @escaping (MissedCallsData) -> Void){
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return}
            do {
                let jsonDecoder = JSONDecoder()
                let callList = try jsonDecoder.decode(CallList.self, from: data)
                completion(.success(callList.list))
            } catch{
                completion(.failure(error))
                }
        }.resume()
        
    }
    
}
