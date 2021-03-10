//
//  NetworkManager.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 10.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import Foundation

protocol NetworkProtocol: class {
    func fetchContacts(fromUrl url: String, completion: @escaping (CallList) -> Void)
}

class NetworkManager: NetworkProtocol {
    
    public static var shared = NetworkManager()
    private init(){}
    
    func fetchContacts(fromUrl url: String, completion: @escaping (CallList) -> Void){
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("exit")
                return}
            print("exit2")
            do {
                let jsonDecoder = JSONDecoder()
                let callList = try jsonDecoder.decode(CallList.self, from: data)
                print(callList)
//                completion(calls)
            } catch let error as NSObject{
                    print(error)
                }
        }.resume()
        
    }
    
}
