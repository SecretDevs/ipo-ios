//
// Created by Sviatoslav on 10.04.2021.
//

import Foundation

extension String {

    var phoneNumber: String {
        print(self
                .replacingOccurrences(of: "+", with: "")
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: "-", with: "")
        )
        return self
                .replacingOccurrences(of: "+", with: "")
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: "-", with: "")
    }
}