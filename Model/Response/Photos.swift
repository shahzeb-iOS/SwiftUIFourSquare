//
//  Photos.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/21.
//
import Foundation
//MARKS:- Images Model
struct Images:Hashable,Codable {
    var id:String
    var created_at:String
    var prefix:String
    var suffix:String
    var width:Int
    var height:Int
}
//MARKS:- Details Model
struct  details {
    var name:String
    var distance:Float
    var categoryName:String
}
