//
// Created by JelliedFish on 10.04.2021.
//

import Foundation
import SwiftUI


class LocalStorage {
     var keyOne : String = "state"

    func setToLocalStorage() {
        let defaults = UserDefaults.standard
        defaults.set("visited", forKey: keyOne)

    }

    func getFromLocalStorage() -> String   {

        let defaults = UserDefaults.standard

        if let stringOne = defaults.string(forKey: keyOne) {
            return stringOne // Some String Value
        }
        else {
            return "not visited"
        }


    }


}


