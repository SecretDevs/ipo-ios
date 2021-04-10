//
// Created by JelliedFish on 09.04.2021.
//

import Foundation
import SwiftUI


class CodeRouter: ObservableObject {
    @Published var isRight : Bool = false
    @Published var code : String = ""
}