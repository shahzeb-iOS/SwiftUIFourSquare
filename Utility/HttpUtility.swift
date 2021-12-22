//
//  HttpUtility.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/20.
//

import Foundation
final class HttpUtility {
    static let shared = HttpUtility()
    private init(){}
    func postData<T:Decodable>(request: URLRequest, resultType:T.Type, completionHandler:@escaping(_ reuslt: T?)-> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if(error == nil && data != nil) {
                let response = try? JSONDecoder().decode(resultType.self, from: data!)
                _ = completionHandler(response)
            }
        }.resume()
    }
}
