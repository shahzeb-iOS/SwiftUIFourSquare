//
//  HeaderImg.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/18.
//

import SwiftUI

struct HeaderImg: View {
    @State private var  searchText = ""
    var body: some View {
        //getting Screen size
        GeometryReader { header in
            //Main vstack
            VStack {
                //items overlapping
                ZStack {
                    Image("R1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: header.size.width, height: header.size.height/4, alignment: .bottomLeading)
                        .clipped()
                    Text("FourSquare")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .scaledToFit()
                        .background(Color.clear, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(50)
                    }
                //getting line
                Divider()
                //searchbar
                HStack {
                    searchFields(searchText: searchText)
                }.background(Color(UIColor.clear))
            }
        }
        }
    }
struct searchFields: View {
    @State  var searchText:String
    var body: some View {
        Image(systemName: "magnifyingglass")
            //.resizable()
            .padding()
            .padding(.trailing,-10)
            .background(Color.white, alignment: .center)
                TextField("Search....", text: $searchText)
                    .font(.title)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding(.leading,0)
                    .padding(.trailing,2)
    }
}
struct HeaderImg_Previews: PreviewProvider {
    static var previews: some View {
        HeaderImg()
    }
}
