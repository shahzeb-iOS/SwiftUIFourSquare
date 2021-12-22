//
//  PreviewPhotos.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/19.
//

import SwiftUI

struct PreviewPhotos: View {
    var body: some View {
        GeometryReader { photos in
            HStack {
                ForEach(0..<5) { _ in
                    Image("resturant")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }.frame(width: photos.size.width, height: photos.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
      
       
    }
}

struct PreviewPhotos_Previews: PreviewProvider {
    static var previews: some View {
        PreviewPhotos()
    }
}
