//
// Created by Илья Разработчик on 08.03.2021.
//

import Foundation
import SwiftUI
struct TransactionsView: View {


    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 10){
                ForEach(transactions){ transaction in
                    TransactionCardView(transaction: transaction)
                }
            }
                    .padding()
        }
        .background(Color("BackgroundThemeColor"))
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
