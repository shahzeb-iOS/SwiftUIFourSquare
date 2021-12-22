//
//  PlacesDetails.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/19.
//

import SwiftUI

struct PlacesDetails: View {
    @StateObject var apiManager = ApiIntegrations()
     var imagesClicked:results!
    @State var tipsDetails = [Tips]()
    @State var nearByplaces = [results]()
    @State var photos = [Images]()
    var body: some View {
        GeometryReader { header in
        VStack {
            Image("resturant")
                .scaledToFit()
                .frame(width: header.size.width, height: header.size.height/4.5, alignment: .center)
                .clipped()
            HStack {
                Text(imagesClicked.name).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(imagesClicked.categories.first!.name).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        SegmentedView(tipsDetails: tipsDetails, nearByplaces: nearByplaces, photos: photos, selectedItem: 0)
        }
        .navigationBarTitle("DetailsPlaces",displayMode: .inline)
        .navigationBarItems(trailing: Button(action: { print("pressed video")
        }) {
            Text("Video")
        })
        .onAppear() {
            //show tips using fsqID
            apiManager.TipsApi(fsqID: imagesClicked.fsq_id) { data in
                tipsDetails = data
                print(data.count)
                
            }
            //showing photos using lat and lan
            apiManager.nearPlacesSearching(latitude: imagesClicked.geocodes.main.latitude, longitude: imagesClicked.geocodes.main.latitude) { nearPlacesData in
                nearByplaces = nearPlacesData.results
                print(nearByplaces.count)
            }
            //loading images
            apiManager.imagesFromid(id: imagesClicked.fsq_id) { dataImages in
                photos = dataImages
                print(photos.count)
            }
        }
}
       
    }
}
//Segmented view with three buttons
struct SegmentedView:View {
    let formatter = DateFormatter()
    @StateObject var apiManager = ApiIntegrations()
    var imagesClicked:results!
    var tipsDetails = [Tips]()
    var nearByplaces = [results]()
    var photos = [Images]()
    @State var selectedItem:Int
    let column = [
        GridItem(.adaptive(minimum: 200),spacing: 2)
    ]
    var body: some View {
        Picker("Selected View", selection: $selectedItem) {
            Text("Photos").tag(0)
            Text("Tips").tag(1)
            Text("Near places").tag(2)
        }
        .pickerStyle(SegmentedPickerStyle())
        .foregroundColor(.blue)        //show according to press button
        switch selectedItem {
        //Photos CollectionView
        case 0:
            ScrollView{
                
                LazyVGrid(columns:column){
                    ForEach(Array(photos.enumerated()), id:\.offset){  index , image in
                        NavigationLink(
                            destination: PreviewImages(images: photos, count: photos.count, index: index),
                            label: {
                                let prefix = image.prefix
                                let suffix = image.suffix
                                let size = "200x200"
                                let orignal = prefix + size + suffix
                                Image(uiImage: orignal.LetsLoadImage())
                                    .frame(width: 200, height: 200)
                            })
                    }
                }
            }
           //Tips
        case 1:
            Text("Tips")
            List {
                ForEach(tipsDetails,id:\.self) { tips in
                    
                    Text(dateFormat(created: tips.created_at))
                        .bold()
                        .padding()
                        .padding(.bottom,20)
                    Text(tips.text)
                        .foregroundColor(.gray)
                        .padding()
                }
            }
        //NearbyPlaces view
        case 2:
            Text("NearPlaces")
            List{
                ForEach(nearByplaces,id:\.self){ data in
                    
                    let distance = String(data.distance)
                    HStack {
                        let imageURl = data.categories.first!.icon.prefix + "bg_120" + data.categories.first!.icon.suffix
                        Image(uiImage: imageURl.LetsLoadImage())
                       // Image(uiImage: imageURl)
                        VStack {
                            Text(data.name)
                            .font(.system(size: 18))
                            .bold()
                            .padding(.leading,20)
                            .padding(.bottom,3)
                            Text(data.categories.first!.name)
                                .foregroundColor(.gray)
                        }
                       Text(distance)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.green)
                        .padding(.trailing,20)
                        
                }
                
                }
            }.background(Color.gray)
            .cornerRadius(15)
            .padding(.leading,20)
            .padding(.trailing,20)
        default:
            Text("Show")
        }

    }
    func dateFormat(created:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: created) else { return (created)
             }
       // formatter.dateFormat = "yyyy-MM-dd"
        return (formatter.string(from: (date)) ?? "unable to get date")
        
    }
}
struct PlacesDetails_Previews: PreviewProvider {
    @State static var category:String = ""
    static var previews: some View {
        PlacesDetails()
    }
}
