//
// Created by JelliedFish on 28.03.2021.
//

import Foundation
import SwiftUI

struct DiscountsTransactionsView: View {


    var body: some View {

        VStack(alignment: .center) {

            Spacer()

            VStack {

                Image("lock").resizable().renderingMode(.template)
                        .frame(width: 47, height: 60).foregroundColor(Color("Grey"))

                Text("Акционные сделки \n   заблокированы").font(.system(size: 25)).fixedSize().foregroundColor(Color.black).padding(5)

                Text("Но вы можете посмотреть статистику").font(.system(size: 11)).foregroundColor(Color.black).padding(5)

                Button(action: {

                }) {
                    HStack {

                        Image("analytics_discounts").resizable().renderingMode(.template)
                                .frame(width: 13.96, height: 13.42).foregroundColor(Color("ThemeColor"))

                        Text("Статистика").font(.system(size: 12)).foregroundColor(Color("ThemeColor"))

                    }.frame(width: 147, height: 45).background(Color("Grey-2")).clipShape(RoundedRectangle(cornerRadius: 10)).padding(5)
                }

            }

            Spacer()

            VStack {

                Button(action: {

                }) {
                    Button(action: {

                    }) {

                        Text("Получить доступ").font(.system(size: 12)).foregroundColor(Color.white).padding(.horizontal)

                        Text("12 000 ₽").font(.system(size: 11)).foregroundColor(Color("Grey")).padding(.horizontal)

                    }.frame(width: 225, height: 45).background(Color("ThemeColor")).clipShape(RoundedRectangle(cornerRadius: 15)).padding(10)
                }

                Text("Чтобы разблокировать акционные сделки \n вам необходимо купить подписку на них!")
                        .font(.system(size: 11)).foregroundColor(Color.black).padding(10)

            }



        }.padding(.vertical, 20)
    }
}

struct DiscountsTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}