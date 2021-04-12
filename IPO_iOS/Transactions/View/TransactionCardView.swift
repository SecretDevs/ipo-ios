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
                Text("#\(transaction.id)")
                        .font(.custom("EuclidSquare-Medium",size: 10))
                        .fontWeight(.medium)
                        .foregroundColor(Color("DarkGrey"))
                Spacer()
                HStack{
                    Text(transaction.createdAt.dateForTransaction)
                            .font(.custom("EuclidSquare-Medium",size: 10))
                            .fontWeight(.medium)
                            .foregroundColor(Color("DarkGrey"))
                    if(transaction.isFavorite){
                        Image("favorite").resizable().renderingMode(.template)
                                .frame(width: 16, height: 16).foregroundColor(Color("Orange"))
                                .onTapGesture(perform: {
                                    transaction.isFavorite//.toggle()
                                })
                    }else{
                        Image("favorite-border").resizable().renderingMode(.template)
                                .frame(width: 16, height: 16).foregroundColor(Color("DarkGrey"))
                                .onTapGesture(perform: {
                                    transaction.isFavorite//.toggle()
                                })
                    }
                }
            }
            HStack{
                Text(transaction.name)
                        .font(.custom("EuclidSquare-Medium",size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(Color("Black"))
                Text(transaction.ticker)
                        .font(.custom("EuclidSquare-Medium",size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(Color("DarkGrey"))
            }
            HStack{
                TransactionStatusTag(status: transaction.status)
                TransactionRiskTag(risk: transaction.risk)
            }
            Text(transaction.description)
                    .font(.custom("EuclidSquare-Medium",size: 12))
                    .foregroundColor(Color("Black"))
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
