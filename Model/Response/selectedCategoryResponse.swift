//
//  Model.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/19.
//

import Foundation
//MARKS:- Welcome Model
struct Welcome:Hashable,Codable  {
    let results: [results]
}
struct results:Hashable,Codable  {
    let fsq_id:String
    let categories: [category]
    let distance: Float
    let name:String
    let geocodes:geocodes
}
struct category:Hashable, Codable    {
    let id: Int
    let name:String
    let icon: icon
}
struct icon: Hashable,Codable    {
    let prefix:String
    let suffix:String
}
struct geocodes:Hashable,Codable {
    let main: main
}
struct location:Hashable, Codable {
    let address:String
    let country:String
//let cross_street:String
    let dma:String
    let locality:String
    let postcode:String
    let region:String


}
struct main:Hashable,Codable {
    let latitude: Double
    let longitude: Double
}
struct context :Hashable, Codable {
    let geo_bounds: geo_bounds
    let etc = "example"
}
struct geo_bounds:Hashable,Codable {
    let circle: circle
}
struct circle:Hashable,Codable {
    let center: center
    let radius:Int
}
struct center:Hashable,Codable  {
    let latitude:Float
    let longitude:Float
}
