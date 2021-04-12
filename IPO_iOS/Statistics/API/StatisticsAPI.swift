//
// Created by Sviatoslav on 11.04.2021.
//

import Foundation
import Alamofire
import Combine

class StatisticsAPI {
    static func fetchStatistics() -> AnyPublisher<StatisticsResponse, AFError> {
        let publisher = RequestAPI.call("orders/stats", method: .get, parameters: nil).publishDecodable(type: StatisticsResponse.self)
        return publisher.value()
    }
}
