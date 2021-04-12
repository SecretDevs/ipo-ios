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
                if(transactionsViewModel.transactions.count != 0){
                    ForEach(0...transactionsViewModel.transactions.count - 1, id: \.self){
                        TransactionCardView(transactionsViewModel: transactionsViewModel, transaction: self.$transactionsViewModel.transactions[$0])
                    }
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