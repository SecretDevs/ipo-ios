//
// Created by Sviatoslav on 10.04.2021.
//

import Foundation
import Combine
import Alamofire

class CodeViewModel: ObservableObject {
    @Published var state : PinState = PinState.NOT_COMPLETED
    var cancellation: AnyCancellable?

    func checkCode(parameters: Parameters?) {
        cancellation = AccountAPI.checkCode(parameters)
                .mapError({ (error) -> Error in
                    print(error)
                    self.state = PinState.INCORRECT
                    print(self.state)
                    return error
                })
                .sink(receiveCompletion: { _ in }, receiveValue: { response in
                    self.state = PinState.CORRECT
                    UserDefaults.standard.set(response.token, forKey: "access_token")
                    print(response.token)
                    print(self.state)
                })
    }
}
