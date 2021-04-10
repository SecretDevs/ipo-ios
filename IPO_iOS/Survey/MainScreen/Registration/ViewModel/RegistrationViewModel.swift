//
// Created by Sviatoslav on 09.04.2021.
//

import Foundation
import Combine
import Alamofire

class RegistrationViewModel: ObservableObject {
    @Published var answer : Answer?
    var cancellation: AnyCancellable?

    func requestCode(parameters: Parameters?) {
        cancellation = AccountAPI.requestCode(parameters)
                .mapError({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: { _ in }, receiveValue: { response in
                    self.answer = response
                    print(response.status)
                })
    }
}
