//
// Created by Sviatoslav on 04.04.2021.
//

import Foundation

struct TransactionsResponse: Codable{
    let transactions: [Transaction]

    enum CodingKeys: String, CodingKey{
        case transactions = "orders"
    }
}
