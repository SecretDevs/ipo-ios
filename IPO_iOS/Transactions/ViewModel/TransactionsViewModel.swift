//
// Created by Sviatoslav on 04.04.2021.
//

import Foundation
import Combine
import Alamofire

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

    func addTransactionToFavorites(parameters: Parameters?) {
        cancellation = TransactionsAPI.addTransactionToFavourites(parameters)
                .mapError({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: { _ in }, receiveValue: { response in
                    print(response)
                    for var transaction in self.transactions{
                        if(transaction.id == parameters?["id"] as! String){
                            transaction.isFavorite = true
                            print(transaction.isFavorite)
                        }
                    }
                })
    }

    func deleteTransactionFromFavorites(parameters: Parameters?) {
        cancellation = TransactionsAPI.deleteTransactionFromFavourites(parameters)
                .mapError({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: { _ in }, receiveValue: { response in
                    print(response)
                    var index = 0
                    for var transaction in self.transactions{
                        if(transaction.id == parameters?["id"] as! String){
                            transaction.isFavorite = false
                            if(self.type == "favourites"){
                                self.transactions.remove(at: index)
                                index -= 1
                            }
                        }
                        index += 1
                    }
                })
    }
}
