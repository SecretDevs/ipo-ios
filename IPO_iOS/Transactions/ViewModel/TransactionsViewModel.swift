//
// Created by Sviatoslav on 04.04.2021.
//

import Foundation
import Combine

class TransactionsViewModel : ObservableObject {
    @Published var transactions : [Transaction] = []
    var cancellation: AnyCancellable?

    init() {
        fetchTransactions()
    }

    func fetchTransactions() {
        cancellation = TransactionsAPI.fetch(nil)
                .mapError({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: { _ in }, receiveValue: { response in
                    self.transactions = response.transactions
                })
    }
}
