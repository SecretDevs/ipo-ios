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

            VStack{

                switch viewRouter.index{

                case 0:

                    TransactionsView(viewRouter: viewRouterForTransactions)

                case 1:

                     LessonsView()

                case 2:

                     IPOView()

                case 3:

                     NewsView()

                case 4:

                     AccountView()

                default:

                     TransactionsView(viewRouter: viewRouterForTransactions)
                }

                Spacer()

                BottomNavBar(viewRouter: viewRouter)


            }.background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))

        }.navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
