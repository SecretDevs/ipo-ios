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

extension String {

    var date: String {
        let date = self.prefix(10)
        let dateArray = date.components(separatedBy: "-")
        return "\(dateArray[2]).\(dateArray[1]).\(dateArray[0].suffix(2))"
    }
}

extension String {

    var dateForTransaction: String {
        let date = self.prefix(10)
        let time = self.suffix(13).prefix(5)
        let dateArray = date.components(separatedBy: "-")
        return "\(dateArray[2]).\(dateArray[1]).\(dateArray[0]) • \(time)"
    }
}