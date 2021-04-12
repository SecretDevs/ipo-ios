//
// Created by Sviatoslav on 27.03.2021.
//

import Foundation

struct Transaction : Codable, Identifiable{
    let id : String
    let type : String
    let name: String
    let ticker: String
    let description: String
    let createdAt: String
    let risk : Risk
    let status : Status
    let isFavorite : Bool

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case type
        case name
        case ticker
        case description
        case createdAt = "created_at"
        case risk
        case status
        case isFavorite = "is_favourite"
    }

}

/*var transactions = [
    Transaction(name: "ON24", createdAt: "20.03.2020 19:44", ticker: "ON24", status: Status.CLOSED,
            risk: Risk.MIDDLE, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.",
            isFavorite: false),
    Transaction(name: "MYT Netherlands", createdAt: "20.03.2020 22:25", ticker: "MYTE", status: Status.OPEN,
            risk: Risk.LOW, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.",
            isFavorite: true),
    Transaction(name: "Bumble", createdAt: "20.04.2021 20:42", ticker: "BMBL", status: Status.AVERAGED,
            risk: Risk.HIGH, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.",
            isFavorite: false),
    Transaction(name: "TELUS International", createdAt: "20.03.2020 19:44", ticker: "TIXT", status: Status.OPEN,
            risk: Risk.MIDDLE, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.",
            isFavorite: false),
]*/