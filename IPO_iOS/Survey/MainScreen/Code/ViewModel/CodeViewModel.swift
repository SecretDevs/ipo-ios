//
// Created by Sviatoslav on 10.04.2021.
//

import Foundation
import Combine
import Alamofire

class CodeViewModel: ObservableObject {
    @Published var answer : TokenAnswer?
    var cancellation: AnyCancellable?

    func checkCode(parameters: Parameters?) {
        cancellation = AccountAPI.checkCode(parameters)
                .mapError({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: { _ in }, receiveValue: { response in
                    self.answer = response
                    UserDefaults.standard.set(response.token, forKey: "access_token")
                    print(response.token)
                })
    }
}
