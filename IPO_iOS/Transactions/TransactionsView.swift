//
// Created by Илья Разработчик on 08.03.2021.
//

import Foundation
import SwiftUI
struct TransactionsView: View {

    @StateObject var viewRouter: ViewRouterTransactions;


    var body: some View {
        VStack{
            ToggleButtonsView(viewRouter: viewRouter).padding()

            switch viewRouter.index {

            case 0:

                FavoriteTransactionsView()

            case 1:

                IPOTransactionsView()

            case 2:

                SPACTransactionsView()

            case 3:
                DiscountsTransactionsView()

            default:
                FavoriteTransactionsView()

            }
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
