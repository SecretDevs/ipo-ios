//
// Created by Sviatoslav on 04.04.2021.
//

import Foundation
import Alamofire
import Combine

class TransactionsService {
    let url = "https://ipo-app.herokuapp.com/"

    func fetch() -> AnyPublisher<TransactionsResponse, AFError> {
        let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2MDY4OGY3YTM2YTkzNTAwMDRmOTVjOGYiLCJpYXQiOjE2MTc0NjUyMTB9.GiXXaZ1mb2FnM2ZP_5neHwhKG4Iwhy0SxEjkQ9cQ1gw"
        let publisher = AF.request(url + "orders?type=IPO", headers: HTTPHeaders(["Authorization": "Bearer \(accessToken)"])).publishDecodable(type: TransactionsResponse.self)
        return publisher.value() // value publisher
    }
}
