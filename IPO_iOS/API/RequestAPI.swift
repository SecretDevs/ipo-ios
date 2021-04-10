//
// Created by Sviatoslav on 09.04.2021.
//

import Alamofire
import Foundation
import SwiftyJSON

struct RequestAPI {
    static func call(_ path: String, method: HTTPMethod, parameters: Parameters?) -> DataRequest {
        let baseURL = "https://ipo-app.herokuapp.com/"
        let url = baseURL + path
        let accessToken = UserDefaults.standard.string(forKey: "access_token") ?? ""
        let headers: HTTPHeaders = ["Authorization": "Bearer \(accessToken)"]

        return AF.request(url, method: method, parameters: parameters, headers: headers)
    }
}
