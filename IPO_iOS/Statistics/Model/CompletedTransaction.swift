//
// Created by Sviatoslav on 31.03.2021.
//

import Foundation

struct CompletedTransaction : Codable {
    var name: String
    var date : String
    var profit : Int
    var account: Int
}
