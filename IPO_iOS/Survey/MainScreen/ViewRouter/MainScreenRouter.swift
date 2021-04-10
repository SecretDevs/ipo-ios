//
// Created by JelliedFish on 08.04.2021.
//

import Foundation
import SwiftUI


class MainScreenRouter : ObservableObject{
    @Published var index: Int = 1
    @Published var phone: String = UserDefaults.standard.string(forKey: "phone") ?? ""
}