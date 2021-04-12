//
// Created by Sviatoslav on 11.04.2021.
//

import Foundation
import SwiftUI

struct TableView: View {
    @Binding var completedTransactions : [CompletedTransaction]

    var body: some View {
        VStack(alignment: .center){
            let count = completedTransactions.count
            Spacer(minLength: 34)
            HStack(spacing: 8){
                Text("Дата")
                        .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                        .foregroundColor(Color("DarkGrey"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                Text("IPO")
                        .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                        .foregroundColor(Color("DarkGrey"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                Text("Прибыль %")
                        .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                        .foregroundColor(Color("DarkGrey"))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                Text("Результат")
                        .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                        .foregroundColor(Color("DarkGrey"))
                        .frame(maxWidth: .infinity, alignment: .trailing)
            }
            if(count != 0){
                ForEach(0...count - 1, id: \.self){
                    let index = $0
                    Spacer(minLength: 12)
                    Divider().foregroundColor(Color("Grey-2"))
                    HStack(spacing: 8){
                        Text(completedTransactions[index].date.date)
                                .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                                .foregroundColor(Color("Black"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        Text(completedTransactions[index].name)
                                .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                                .foregroundColor(Color("Black"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(completedTransactions[index].profit)%")
                                .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                                .foregroundColor(Color(completedTransactions[index].profit > 0 ? "Green" : (completedTransactions[index].profit == 0 ? "Black" : "Red")))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        Text("\(completedTransactions[index].profit < 0 ? "-" : "")$\(completedTransactions[index].account)")
                                .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                                .foregroundColor(Color("Black"))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                Spacer(minLength: 27)
            }
        }.frame(maxWidth: .infinity)
    }
}