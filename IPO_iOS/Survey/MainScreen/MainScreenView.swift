//
// Created by JelliedFish on 08.04.2021.
//

import Foundation
import SwiftUI

struct MainScreenView: View{

    @StateObject var surveyRouter: SurveyRouter = SurveyRouter()


    @StateObject var mainScreenRouter : MainScreenRouter
    var body : some View {
        VStack {
            switch (mainScreenRouter.index) {

            case 1:
                Registration(mainScreenRouter: mainScreenRouter)

            case 2:
                MainSurveyView(surveyRouter: surveyRouter, mainScreenRouter: mainScreenRouter)

            default:
                Registration(mainScreenRouter: mainScreenRouter)
            }
        }
    }
}