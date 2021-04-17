//
// Created by Sviatoslav on 27.03.2021.
//

import Foundation
import Combine

class Transaction : Codable, Identifiable, ObservableObject{
    @Published var id : String
    @Published var type : String
    @Published var name: String
    @Published var ticker: String
    @Published var description: String
    @Published var createdAt: String
    @Published var risk : Risk
    @Published var status : Status
    @Published var isFavorite : Bool
    @Published var isLoading : Bool

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

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(String.self, forKey: .type)
        name = try container.decode(String.self, forKey: .name)
        ticker = try container.decode(String.self, forKey: .ticker)
        description = try container.decode(String.self, forKey: .description)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        risk = try container.decode(Risk.self, forKey: .risk)
        status = try container.decode(Status.self, forKey: .status)
        isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
        isLoading = false
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encode(name, forKey: .name)
        try container.encode(ticker, forKey: .ticker)
        try container.encode(description, forKey: .description)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(risk, forKey: .risk)
        try container.encode(status, forKey: .status)
        try container.encode(isFavorite, forKey: .isFavorite)
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