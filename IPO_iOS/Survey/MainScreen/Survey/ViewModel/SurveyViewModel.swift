//
// Created by Sviatoslav on 12.04.2021.
//

import Foundation
import Combine
import Alamofire

class SurveyViewModel: ObservableObject {
    @Published var answer : SaveSurveyResultsAnswer?
    var cancellation: AnyCancellable?

    func checkCode(parameters: Parameters?) {
        cancellation = SurveyAPI.saveSurveyResults(parameters)
                .mapError({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: { _ in }, receiveValue: { response in
                    print(response)
                    self.answer = response
                })
    }
}
