//
// Created by Илья Разработчик on 07.03.2021.
//

import Foundation
import SwiftUI


struct MainView: View {

    @StateObject var viewRouter: ViewRouter;
    @StateObject var viewRouterForTransactions: ViewRouterTransactions;

    var body: some View {
        NavigationView{

            VStack(spacing: 0){

                switch viewRouter.index{

                case 0:

                    TransactionsView(viewRouter: viewRouterForTransactions)

                case 1:

                     LessonsView()
                     Spacer()

                case 2:

                     IPOView()
                     Spacer()

                case 3:

                     NewsView()
                     Spacer()

                case 4:

                     AccountView()
                     Spacer()


                default:

                     TransactionsView(viewRouter: viewRouterForTransactions)
                }

                BottomNavBar(viewRouter: viewRouter)


            }.background(Color("Background").edgesIgnoringSafeArea(.top))

        }.navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
