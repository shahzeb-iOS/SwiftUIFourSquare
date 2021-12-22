//
//  ApiIntegrations.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/19.
//

import Foundation
class ApiIntegrations: ObservableObject {
    var latitude = 41.8781
    var longitude = -87.6298
    func SearchbyId(category:String,Closure:@escaping((Welcome))->())-> Void {
     //   let headers = [
        //    "Accept": "application/json",
      //      "Authorization": foursqKey
       // ]
        let query = "https://api.foursquare.com/v3/places/search?query=\(category)&ll=\(latitude)%2C\(longitude)&limit=50"
        let request = NSMutableURLRequest(url: NSURL(string: query)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
              //  print(httpResponse)
            }
            guard let data = data  else {
                return
            }
            do {
                var json = try JSONDecoder().decode(Welcome.self, from: data)
                print(json)
                DispatchQueue.main.async {
                   Closure(json)
                }
            }
            catch { print(error.localizedDescription)}
        })
        dataTask.resume()
}
    //MARKS:_ Tips searching using Fsq id
    func TipsApi(fsqID:String,completion:@escaping ([Tips])->()) -> Void
    {

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/\(fsqID)/tips")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
              //  print(httpResponse)
            }
            guard let data = data else {return}
            print(String(data: data, encoding: .utf8)!)
            do {
                let tips = try? JSONDecoder().decode([Tips].self,from:data)
                DispatchQueue.main.async {
                    completion(tips!)
                }
            } catch { print (error.localizedDescription)}
        })

        dataTask.resume()
}
    //MARKS:- Search images Using ID
    func imagesFromid(id:String,completed:@escaping([Images]) -> ()) -> Void
    {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/\(id)/photos")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                //  print(httpResponse)
            }
            guard let data = data else { return}
            print(String(data: data, encoding: .utf8)!)
            do {
                let resultImages = try? JSONDecoder().decode([Images].self,from:data)
                DispatchQueue.main.async {
                    completed(resultImages!)
                }
            }
        })
        dataTask.resume()
    }

    func nearPlacesSearching(latitude:Double,longitude:Double,completion:@escaping (Welcome)->()) -> Void
    {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/nearby?ll=41.8781%2C-87.6298")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data else { return }
            //print(String(data: data, encoding: .utf8)!)
            do
            {
                let result = try JSONDecoder().decode(Welcome.self, from: data)
                //  print (result.results[0].distance)
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            catch {print(error.localizedDescription) }


        })
        dataTask.resume()
    }

    
}
