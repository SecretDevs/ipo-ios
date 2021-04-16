//
// Created by JelliedFish on 28.03.2021.
//

import Foundation
import SwiftUI

struct SPACTransactionsView: View {
    @StateObject var transactionsViewModel = TransactionsViewModel(type: "SPAC")

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                getContent(width: geometry.size.width, height: geometry.size.height)
            }
        }.onAppear{
            transactionsViewModel.fetchTransactions()
        }
    }

    private func getContent(width: CGFloat, height: CGFloat) -> some View {
        switch transactionsViewModel.state {
        case .idle:
            return Color.clear.eraseToAnyView()
        case .loading:
            return VStack{
                ProgressView().scaleEffect(2.0)
            }.frame(width: width, height: height, alignment: .center).eraseToAnyView()
        case .loaded:
            if (transactionsViewModel.transactions.count != 0) {
                return VStack(spacing: 15) {
                    ForEach(transactionsViewModel.transactions) { transaction in
                        TransactionCardView(transactionsViewModel: transactionsViewModel, transaction: transaction)
                    }
                }
                        .padding(20)
                        .eraseToAnyView()
            }else{
                return VStack{
                    Text("Нет сделок")
                            .font(.custom("EuclidSquare-Medium", size: 16))
                }.frame(width: width, height: height, alignment: .center).eraseToAnyView()
            }
        case .error:
            return VStack{
                Text("Ошибка")
                        .font(.custom("EuclidSquare-Medium", size: 16))
            }.frame(width: width, height: height, alignment: .center).eraseToAnyView()
        }
    }
}

struct SPACTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}