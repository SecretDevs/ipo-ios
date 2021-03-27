//
// Created by Sviatoslav on 27.03.2021.
//

import Foundation
import SwiftUI

struct TransactionCardView : View {
    var transaction : Transaction
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Text("#" + transaction.id.prefix(5))
                        .font(.system(size: 10))
                        .fontWeight(.medium)
                        .foregroundColor(Color("DarkGrey"))
                Spacer()
                HStack{
                    Text(transaction.date)
                            .font(.system(size: 10))
                            .fontWeight(.medium)
                            .foregroundColor(Color("DarkGrey"))
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            HStack{
                Text(transaction.title)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(Color("AppBlack"))
                Text(transaction.extraTitle)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(Color("DarkGrey"))
            }
            HStack{
                TransactionStatusTag(status: transaction.status)
                TransactionRiskTag(risk: transaction.risk)
            }
            Text(transaction.text)
                    .font(.system(size: 12))
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
