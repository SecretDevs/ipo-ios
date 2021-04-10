//
// Created by JelliedFish on 08.04.2021.
//

import Foundation
import SwiftUI

struct MainScreenView: View{

    @StateObject var surveyRouter: SurveyRouter = SurveyRouter()
    @StateObject var codeRouter: CodeRouter = CodeRouter()
    @StateObject var viewRouter: ViewRouter = ViewRouter()
    @StateObject var viewRouterForTrascatons: ViewRouterTransactions = ViewRouterTransactions()
    @StateObject var registrationRouter: RegistrationRouter = RegistrationRouter()


    @StateObject var mainScreenRouter : MainScreenRouter
    var body : some View {
        VStack {
            switch (mainScreenRouter.index) {

            case 1:
                Registration(registrationRouter: registrationRouter, mainScreenRouter: mainScreenRouter)

            case 2:
                CodeView(registrationRouter: registrationRouter,codeRouter: codeRouter,mainScreenRouter: mainScreenRouter)

            case 3:
                MainSurveyView(surveyRouter: surveyRouter, registrationRouter: registrationRouter, mainScreenRouter: mainScreenRouter)

            case 4:
                MainView(viewRouter: viewRouter, viewRouterForTransactions: viewRouterForTrascatons)


            default:
                Registration(registrationRouter: registrationRouter, mainScreenRouter: mainScreenRouter)
            }
        }
    }
}