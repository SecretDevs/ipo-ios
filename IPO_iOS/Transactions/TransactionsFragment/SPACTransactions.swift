//
// Created by JelliedFish on 28.03.2021.
//

import Foundation
import SwiftUI

struct SPACTransactionsView: View {
    @ObservedObject var transactionsViewModel = TransactionsViewModel(type: "SPAC")

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                ForEach(transactionsViewModel.transactions){ transaction in
                    TransactionCardView(transaction: transaction)
                }
            }
                    .padding(20)
        }
    }
}

struct SPACTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}