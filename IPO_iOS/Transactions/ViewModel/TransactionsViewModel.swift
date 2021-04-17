//
// Created by Sviatoslav on 04.04.2021.
//

import Foundation
import Combine
import Alamofire

class TransactionsViewModel: ObservableObject {
    @Published var transactions : [Transaction] = []
    @Published var state : ViewState = .idle

    private var cancellation: AnyCancellable?
    private var type: String = "IPO"

    init(type: String) {
        self.type = type
        //self.fetchTransactions()
    }

    func fetchTransactions() {
        self.state = .loading
        cancellation = TransactionsAPI.fetchTransactions(nil, type: self.type)
                .mapError({ (error) -> Error in
                    print(error)
                    self.state = .error
                    return error
                })
                .sink(receiveCompletion: { _ in }, receiveValue: { response in
                    print(response.transactions)
                    self.state = .loaded
                    self.transactions = response.transactions
                })
    }

    func addTransactionToFavorites(parameters: Parameters?) {
        transactions.first(where: {$0.id == parameters?["id"] as! String})?.isLoading = true
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
                            transaction.isLoading = false
                            print(transaction.isFavorite)
                        }
                    }
                })
    }

    func deleteTransactionFromFavorites(parameters: Parameters?) {
        transactions.first(where: {$0.id == parameters?["id"] as! String})?.isLoading = true
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
                            transaction.isLoading = false
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
