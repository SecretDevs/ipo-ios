//
// Created by Sviatoslav on 11.04.2021.
//

import Foundation

struct StatisticsResponse: Codable {
    let completedTransactions: [CompletedTransaction]

    enum CodingKeys: String, CodingKey{
        case completedTransactions = "stats"
    }
}
