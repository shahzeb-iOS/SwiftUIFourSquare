//
//  tabView.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/22.
//

import SwiftUI

struct tabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem{
                    Image("magnifyingglass")
                    Text("search")
                }
                Text("List")
                .tabItem{
                    Image("list.dash")
                    Text("List")
                }
                Text("History")
                .tabItem{
                    Image("timer")
                    Text("History")
                }
                Text("Me")
                .tabItem{
                    Image("Person.crop.square")
                    Text("Me")
                }
        }
    }
}

struct tabView_Previews: PreviewProvider {
    static var previews: some View {
        tabView()
    }
}
