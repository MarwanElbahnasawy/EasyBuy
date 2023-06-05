//
//  RedemeedCell.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 05/06/2023.
//

import SwiftUI

struct RedeemedCell: View {
    @State var code: String = "any thing"
    @State var isUseable: Bool = false
    var body: some View {
        if isUseable{
            ZStack{
                VStack(alignment: .leading) {
                    Text(code)
                        .font(Font.system(size: 14))
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center).padding()
                    Spacer()
                    Text( "Use Now")
                        .padding(10)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .onTapGesture {
                            isUseable = false
                            print("press in redeemed")
                        }
                    
                }
                .padding()
                .background(Color(UIColor.lightGray))
                .cornerRadius(16)
                .frame(height: 100)
                .contentShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
           
        }
        else{
            VStack(alignment: .leading) {
               
                
                    Text(code)
                        .font(Font.system(size: 14))
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center).padding()
            }
            .padding()
            .background(Color(UIColor.lightGray))
            .overlay(
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .leading, endPoint: .trailing)
                   
            )
            .cornerRadius(16)
            .frame(height: 50)
            .contentShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        }
    }


struct RedemeedCell_Previews: PreviewProvider {
    static var previews: some View {
        RedeemedCell()
    }
}
