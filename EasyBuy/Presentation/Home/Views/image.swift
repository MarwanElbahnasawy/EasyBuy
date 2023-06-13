//
//  image.swift
//  final test
//
//  Created by mo_fathy on 04/06/2023.
//

import SwiftUI

struct image: View {
    var CoverImage: CoverImage
    @State var  isGoingTONextView = false
    var body: some View {
            ZStack{
                Image(CoverImage.name)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.95 ,height: UIScreen.main.bounds.width * 0.40 )
                    .scaledToFill()
                    .cornerRadius(25)
                VStack{
                    HStack{
                        Text(CoverImage.title)
                            .font(.custom(Constants.AppFont.boldFont, size: 30))
                        Spacer()
                    }.padding(.leading,24)
                    HStack{
                        Text(CoverImage.des)
                            .font(.custom(Constants.AppFont.regularFont, size: 20))
                        Spacer()
                    }.padding(.leading,20)
                    HStack{
                        Text("With code:")
                            .font(.custom(Constants.AppFont.lightFont, size: 15))
                        Text(CoverImage.code)
                            .font(.custom(Constants.AppFont.lightFont, size: 15))
                        Spacer()
                    }.padding(.leading,26)
                    HStack{
                        NavigationLink {
                            switch CoverImage.name{
                            case "Everything":
                                CodesView(adType: .all)
                            case "MEN":
                                CodesView(adType: .men)
                            case "image cop":
                                CodesView(adType: .women)
                             case "SHOES":
                                CodesView(adType: .shoes)
                            default:
                                CodesView()
                            }
                        } label: {
                             
                                Text("Click Me")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(25)
                                    .frame(width: 150, height: 50)
                                    .padding(.trailing,120)
                           
                        }
                       
                        Spacer()
                    }
                }
            }
    }
}

struct image_Previews: PreviewProvider {
    static var previews: some View {
        
        image(CoverImage: CoverImage(id: 1, name: "image cop", title: "50% Off", des: " On everything today", code: "FSCREATION")).frame(width: 200, height: 200)
    }

}
