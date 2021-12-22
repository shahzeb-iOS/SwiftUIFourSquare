//
//  PreviewImages.swift
//  SwiftUIFourSquare
//
//  Created by Shahzaib on 2021/12/22.
//

import SwiftUI

struct PreviewImages: View {
    @State var images = [Images]()
    @State var count:Int!
    @State var index:Int!
    var body: some View {
        HStack {
                let url = images[index].prefix + "420x420" + images[index].suffix
                Image(uiImage: url.LetsLoadImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(0)
        }
        Button {
            print("Image tapped!")
        } label: {
            Text("Left")
    }
    }
}
struct PreviewImages_Previews: PreviewProvider {
    static var previews: some View {
        PreviewImages()
    }
}
