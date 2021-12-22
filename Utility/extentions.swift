//
//  extentions.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/21.
//

import Foundation
import SwiftUI
//Date Formatter
extension String {
    func dateFormat(created:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: created)
        return (formatter.string(from: date!))
    }
}
//load Images
extension String{
    func LetsLoadImage() -> UIImage{
        do{
            guard let url = URL(string: self) else{
               return UIImage()
            }
            
            let data:Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        }
        catch{
            print(error.localizedDescription)
        }
        
        return UIImage()
    }
}
