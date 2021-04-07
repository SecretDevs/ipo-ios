//
// Created by Sviatoslav on 04.04.2021.
//

import Foundation
import Combine

class TransactionsViewModel : ObservableObject {
    @Published var transactions : [Transaction] = []
    var cancellation: AnyCancellable?
    let service = TransactionsService()

    init() {
        fetchTransactions()
    }

    func fetchTransactions() {
        cancellation = service.fetch()
                .mapError({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: { _ in }, receiveValue: { response in
                    self.transactions = response.transactions
                })
    }
}
