//
// Created by Sviatoslav on 12.04.2021.
//

import Foundation

struct SaveSurveyResultsAnswer: Codable {
    //let riskProfile: Int
    let status: String

    enum CodingKeys: String, CodingKey {
        //case riskProfile = "risk_profile"
        case status
    }
}
