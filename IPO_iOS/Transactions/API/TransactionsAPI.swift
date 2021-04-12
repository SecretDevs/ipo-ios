//
// Created by Sviatoslav on 04.04.2021.
//

import Foundation
import Alamofire
import Combine

class TransactionsAPI {

    static func fetchTransactions(_ parameters: Parameters?, type: String) -> AnyPublisher<TransactionsResponse, AFError> {
        let publisher = RequestAPI.call("orders\(type == "favourites" ? "/favourites" : "?type=\(type)")", method: .get, parameters: parameters).publishDecodable(type: TransactionsResponse.self)
        return publisher.value() // value publisher
    }
}
