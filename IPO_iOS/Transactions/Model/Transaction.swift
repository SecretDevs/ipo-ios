//
// Created by Sviatoslav on 27.03.2021.
//

import Foundation

struct Transaction : Identifiable{
    var id = UUID().uuidString
    var title : String
    var date : String
    var extraTitle : String
    var status : Status
    var risk : Risk
    var text : String
    var isFavorite : Bool
}

var transactions = [
    Transaction(title: "ON24", date: "20.03.2020 19:44", extraTitle: "ON24", status: Status.CLOSED,
            risk: Risk.MIDDLE, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.",
            isFavorite: false),
    Transaction(title: "MYT Netherlands", date: "20.03.2020 22:25", extraTitle: "MYTE", status: Status.OPEN,
            risk: Risk.LOW, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.",
            isFavorite: true),
    Transaction(title: "Bumble", date: "20.04.2021 20:42", extraTitle: "BMBL", status: Status.AVERAGED,
            risk: Risk.HIGH, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.",
            isFavorite: false),
    Transaction(title: "TELUS International", date: "20.03.2020 19:44", extraTitle: "TIXT", status: Status.OPEN,
            risk: Risk.MIDDLE, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo.",
            isFavorite: false),
]