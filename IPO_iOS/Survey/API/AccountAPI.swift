//
// Created by Sviatoslav on 09.04.2021.
//

import Foundation
import Alamofire
import Combine

class AccountAPI {
    static func requestCode(_ parameters: Parameters?) -> AnyPublisher<Answer, AFError> {
        let publisher = RequestAPI.call("login/request-code", method: .post, parameters: parameters).publishDecodable(type: Answer.self)
        return publisher.value()
    }

    static func checkCode(_ parameters: Parameters?) -> AnyPublisher<TokenAnswer, AFError> {
        let publisher = RequestAPI.call("login/check-code", method: .post, parameters: parameters).publishDecodable(type: TokenAnswer.self)
        return publisher.value()
    }
}
