//
// Created by Sviatoslav on 04.04.2021.
//

import Foundation
import Combine

class TransactionsViewModel: ObservableObject {
    @Published var transactions : [Transaction] = []
    var cancellation: AnyCancellable?
    var type: String = "IPO"

    init(type: String) {
        self.type = type
        fetchTransactions()
    }

    func fetchTransactions() {
        cancellation = TransactionsAPI.fetchTransactions(nil, type: self.type)
                .mapError({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: { _ in }, receiveValue: { response in
                    print(response.transactions)
                    self.transactions = response.transactions
                })
    }
}
