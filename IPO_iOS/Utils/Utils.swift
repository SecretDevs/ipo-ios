//
// Created by Sviatoslav on 10.04.2021.
//

import Foundation

extension String {

    var phoneNumber: String {
        return self
                .replacingOccurrences(of: "+", with: "")
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: "-", with: "")
    }
}