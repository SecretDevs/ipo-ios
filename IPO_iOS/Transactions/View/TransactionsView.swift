//
// Created by Илья Разработчик on 08.03.2021.
//

import Foundation
import SwiftUI
struct TransactionsView: View {
    @StateObject var viewRouter: ViewRouterTransactions;


    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                HStack{
                    NavigationLink(destination: StatisticsView()){
                        Image("statistics").resizable().renderingMode(.original)
                                .frame(width: 32, height: 32)
                                .padding()
                    }
                    Spacer()
                    Text("Сделки")
                            .font(.custom("EuclidSquare-Medium", size: 18))
                            .foregroundColor(Color("Black"))
                    Spacer()
                    Button(action: {
                        //TODO
                    }, label: {
                        Text("").frame(width: 21, height: 21)
                            .padding()
                        /*Image("search").resizable().renderingMode(.original)
                                .frame(width: 21, height: 21)
                            .padding()*/                    })
                }

                ToggleButtonsView(viewRouter: viewRouter).padding(.horizontal)

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
                    .background(Color("Background").edgesIgnoringSafeArea(.top))
                    .navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
