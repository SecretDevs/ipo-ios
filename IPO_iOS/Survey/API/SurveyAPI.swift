//
// Created by Sviatoslav on 12.04.2021.
//

import Foundation
import Combine
import Alamofire

class SurveyAPI {
    static func saveSurveyResults(_ parameters: Parameters?) -> AnyPublisher<SaveSurveyResultsAnswer, AFError> {
        let publisher = RequestAPI.call("poll/save", method: .post, parameters: parameters).publishDecodable(type: SaveSurveyResultsAnswer.self)
        return publisher.value()
    }
}
