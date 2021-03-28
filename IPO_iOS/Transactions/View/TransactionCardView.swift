//
// Created by Sviatoslav on 27.03.2021.
//

import Foundation
import SwiftUI

struct TransactionCardView : View {
    @State var transaction : Transaction
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Text("#" + transaction.id.prefix(5))
                        .font(.custom("EuclidSquare-Medium",size: 10))
                        .fontWeight(.medium)
                        .foregroundColor(Color("DarkGrey"))
                Spacer()
                HStack{
                    Text(transaction.date)
                            .font(.custom("EuclidSquare-Medium",size: 10))
                            .fontWeight(.medium)
                            .foregroundColor(Color("DarkGrey"))
                    Star(corners: 5, smoothness: 0.5)
                            .overlay(
                                    Star(corners: 5, smoothness: 0.5)
                                            .stroke(transaction.isFavorite ? .white : Color("DarkGrey"))
                                            .frame(width: 16, height: 16)
                            )
                            .foregroundColor(transaction.isFavorite ? .yellow : .white)
                            .frame(width: 16, height: 16)
                            .onTapGesture(perform: {
                                transaction.isFavorite.toggle()
                            })
                }
            }
            HStack{
                Text(transaction.title)
                        .font(.custom("EuclidSquare-Medium",size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(Color("AppBlack"))
                Text(transaction.extraTitle)
                        .font(.custom("EuclidSquare-Medium",size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(Color("DarkGrey"))
            }
            HStack{
                TransactionStatusTag(status: transaction.status)
                TransactionRiskTag(risk: transaction.risk)
            }
            Text(transaction.text)
                    .font(.custom("EuclidSquare-Medium",size: 12))
                    .foregroundColor(Color("AppBlack"))
        }
        .padding()
        .background(Color(.white))
        .cornerRadius(15)
    }
}

struct TransactionCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
