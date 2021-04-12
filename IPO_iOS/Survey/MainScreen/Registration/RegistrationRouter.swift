//
// Created by JelliedFish on 09.04.2021.
//

import Foundation
import SwiftUI


class RegistrationRouter : ObservableObject {

    @Published var index : Int = 1
    @Published var number : String = "+"
    @Published var checked : Bool = false


    func isCorrect() -> Bool{

        var res = false


        if (number.prefix(1) != "8") {


            if (number.prefix(2) == "+7") {
                if (number.count != 16) {
                    res = false
                } else {
                    res = true
                }
            }

            if (number.prefix(2) == "+1") {
                if (number.count != 17) {
                    res = false
                } else {
                    res = true
                }
            }

        }

        else {
            res = false
        }

        return res

    }
}
