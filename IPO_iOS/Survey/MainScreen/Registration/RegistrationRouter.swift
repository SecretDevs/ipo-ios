//
// Created by JelliedFish on 09.04.2021.
//

import Foundation
import SwiftUI


class RegistrationRouter : ObservableObject {

    @Published var index : Int = 1
    @Published var number : String = ""
    @Published var checked : Bool = false

}