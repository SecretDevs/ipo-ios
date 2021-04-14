//
// Created by JelliedFish on 28.03.2021.
//

import Foundation
import SwiftUI

struct IPOTransactionsView: View {
    @ObservedObject var transactionsViewModel = TransactionsViewModel(type: "IPO")

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                if(transactionsViewModel.transactions.count != 0){
                    ForEach(transactionsViewModel.transactions){ transaction in
                        TransactionCardView(transactionsViewModel: transactionsViewModel, transaction: transaction)
                    }
                }
            }
                    .padding(20)
        }
    }
}

struct IPOTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}