//
//  ContentView.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/18.
import SwiftUI
struct ContentView: View {
@State var img = ""
@State private var  searchText:String = ""
var category:String = ""
var body: some View {
NavigationView {
    GeometryReader { header in
        //Main vstack
VStack {
    //items overlapping
    ZStack {
        Image("R1")
            .resizable()
            .scaledToFill()
            .frame(width: header.size.width, height: header.size.height/3, alignment: .bottomLeading)
            .clipped()
        Text("FourSquare")
            .font(.largeTitle)
            .foregroundColor(.white)
            .scaledToFit()
            .background(Color.clear, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(50)
        }
            //getting line
            //searchbar
            HStack {
                //searchField(searchText: searchText)
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
                NavigationLink(
                    destination: Places(query:searchText.replacingOccurrences(of:" ",with:"%20")),
                    label: {
                        Text("Search")
                            .padding(.trailing,20)
                            .foregroundColor(.gray)
                    })

            }.background(Color(UIColor.white))
    //Buttons Settings
        GeometryReader { buttonSize in
            VStack {
        HStack {
            NavigationLink(
                destination: Places(query:breakFast),
                label: {
                    VStack {
                        CreateButtons(img: "breakfast-48", category: "Breakfast")
                    }
                }).frame(maxWidth: .infinity)
            Divider()
            NavigationLink(
                destination: Places(query: lunch),
                label: {
                    VStack {
                        CreateButtons(img: "lunch-48", category: "Lunch")
                        
                    }
                }) .frame(maxWidth: .infinity)
            Divider()
            NavigationLink(
                destination: Places(query: dinner),
                label: {
                    VStack {
                        CreateButtons(img: "dinner-48", category: "Dinner")
                    }
                }).frame(maxWidth: .infinity)
            Divider()

        }.frame(minWidth: 0, maxWidth: buttonSize.size.width, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/ ,maxHeight: buttonSize.size.height/2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Divider()
                HStack (){
            NavigationLink(
                destination: Places(query: teaandCofee),
                label: {
                    VStack {
                        CreateButtons(img: "coffee-maker-50", category: "Cofee and Tea")
                    }
                }).frame(maxWidth: .infinity)
                    Divider()
            NavigationLink(
                destination: Places(query: nightLife),
                label: {
                    VStack {
                        CreateButtons(img: "food-service-50", category: "NightLife")
                    }
                }).frame(maxWidth: .infinity)
                    Divider()
            NavigationLink(
                destination: Places(query: thingstodo),
                label: {
                    VStack {
                        CreateButtons(img: "gymnastic-50", category: "ThingstoDo")
                    }
                }).frame(maxWidth: .infinity)
                    Divider()
            
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: buttonSize.size.width, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/ ,maxHeight: buttonSize.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
Divider()
    }
   
            }
}
    
    }.navigationBarHidden(true)
    .navigationBarTitle("FourSquare")
    .background(Color(red: 0.91, green: 0.91, blue: 0.91))
        }.navigationViewStyle(StackNavigationViewStyle())
    Spacer()
}
}
//SearchFields created
struct searchField: View {
    @Binding  var searchText:String
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
struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView()
}
}
struct CreateButtons:View {
@State var img:String
@State var category:String
var body: some View {
Image(img)
Text(category)
    .foregroundColor(.black)
}

}
