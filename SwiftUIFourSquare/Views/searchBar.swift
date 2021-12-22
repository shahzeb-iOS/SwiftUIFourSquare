//
//  searchBar.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/18.
//

import SwiftUI

struct searchBar: View {
    @State  var  searchText = ""
    var body: some View {
        GeometryReader { search in
            HStack {
                Image(systemName: "magnifyingglass")
                    //.resizable()
                        TextField("Search....", text: $searchText)
                            .foregroundColor(.blue)
            }.frame(width: search.size.width, height:search.size.height/15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color(UIColor.lightText))
        }.padding(.top,0)
    }
}

struct searchBar_Previews: PreviewProvider {
    static var previews: some View {
        searchBar()
    }
}
