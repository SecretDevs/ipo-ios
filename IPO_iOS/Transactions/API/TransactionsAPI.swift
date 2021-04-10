//
// Created by Sviatoslav on 04.04.2021.
//

import Foundation
import Alamofire
import Combine

class TransactionsAPI {

    static func fetch(_ parameters: Parameters?) -> AnyPublisher<TransactionsResponse, AFError> {
        let publisher = RequestAPI.call("orders?type=IPO", method: .get, parameters: parameters).publishDecodable(type: TransactionsResponse.self)
        return publisher.value() // value publisher
    }
}
