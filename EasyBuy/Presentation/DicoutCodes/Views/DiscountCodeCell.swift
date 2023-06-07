//
//  DiscountCodeCell.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 04/06/2023.
//

import SwiftUI

struct DiscountCodeCell: View {
    @State var discountCode: CodeDiscountNodesNode?
    @ObservedObject var cellViewModel: DiscountCodeViewModel
    @State var animationAmount = 1.0
    let customerID = UserDefaults.standard.string(forKey: "customerID")

    var body: some View {
        ZStack(alignment: .center) {
            Image(cellViewModel.getImageName())
                .resizable()
                .scaledToFill()
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .leading, endPoint: .trailing)
                       
                ) .cornerRadius(16)
                .frame(height: 120)
                .contentShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            VStack(alignment: .leading) {
                Text(cellViewModel.title )
                    .font(Font.system(size: 18)).fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10)
                Text(cellViewModel.summury)
                    .font(Font.system(size: 14)).fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,20)
                Spacer()
                Text("with code : \(cellViewModel.code)")
                    .font(Font.system(size: 12))
                    .foregroundColor(Color(UIColor.darkGray))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30)
                Spacer()
                Text(cellViewModel.isUsed ? "Redemed" : "Get Now") .onAppear {
                    print(cellViewModel.isUsed)
                    print("customer id is : \(String(describing: customerID))")
                    cellViewModel.isExist(id: customerID!,customerCode: cellViewModel.code)
                    self.animationAmount = 1.1
                }
                    .padding(10)
                    .background(cellViewModel.isUsed ?.gray : Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .scaleEffect(cellViewModel.isUsed ? 1 : animationAmount)
                    .animation( Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animationAmount)
                   
                    .onTapGesture {
                        print("pressing....")
                        cellViewModel.saveCodeForCustomer(id: customerID!, customerCode: cellViewModel.code)
                    }.disabled(cellViewModel.isUsed)
                    
            
            }
            .padding()
        }
    }
}

struct DiscountCodeCell_Previews: PreviewProvider {
    static var previews: some View {
        DiscountCodeCell(discountCode: nil, cellViewModel: DiscountCodeViewModel(discountCode: nil,adType: .all))
    }
}

