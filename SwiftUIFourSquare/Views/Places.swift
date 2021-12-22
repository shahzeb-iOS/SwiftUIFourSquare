//
//  Places.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/19.
//

import SwiftUI

struct Places: View {
    @StateObject var apiManager = ApiIntegrations()
    @State var fetchedPlace = [results]()
  //   var searching: Bool = false
    //@Binding var mainList: [String]
    //@Binding var searchedList: [String]
    var searchStart = ""
    var details:results!
    @State var searchInput = ""
    @State var searchText = ""
    var query:String!
    var body: some View {
        VStack
        {
            HStack {
                searchField(searchText: $searchText)
            }.background(Color(UIColor.white))
            List{
                if loadingStart  {
                ProgressView()
                }
                else {
                    ForEach(fetchedPlace.filter{self.searchText.isEmpty ?  true : $0.name.contains(self.searchText)},id:\.self){ data in
                    //let size = data.categories.first?.icon.prefix + "bg_120" + data.categories.first?.icon.suffix
                 let distance = String(data.distance)
                    NavigationLink(destination: PlacesDetails(imagesClicked: data),label:  {
                    HStack {
                       
                        let imageURl = data.categories.first!.icon.prefix + "bg_120" + data.categories.first!.icon.suffix
                        Image(uiImage: imageURl.LetsLoadImage())
                       // Image(uiImage: imageURl)
                        VStack {
                            Text(data.name)
                            .font(.system(size: 16))
                            .bold()
                            //.foregroundColor(.gray)
                            .padding(.leading,15)
                            .padding(.bottom,3)
                            Text(data.categories.first!.name)
                                .foregroundColor(.gray)
                        }
                       Text(distance)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.green)
                        .padding(.trailing,20)
                        
                }
                })
                }
                }
            }.cornerRadius(15)
            .padding(.leading,20)
            .padding(.trailing,20)
            .onAppear {
                loadingStart = true
                apiManager.SearchbyId(category: query) { (data) in
                    self.fetchedPlace = data.results
                    loadingStart = false
                }
                
            }
        }.background(Color.gray)
        .navigationBarTitle("Select Places",displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {print("Lunch")}, label: {
            Text(query)
        }))
}
}
struct Places_Previews: PreviewProvider {

    static var previews: some View {
        Places()
    }
}
