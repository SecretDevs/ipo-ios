//
// Created by JelliedFish on 04.04.2021.
//

//
// Created by JelliedFish on 03.04.2021.
//

import Foundation
import SwiftUI


struct MainSurveyScreen : View {
    var data1 =  ["Менее $10 000","$10 000 - $50 000","$50 000 - $250 000","Более $250 000"]

    var data2 =  ["Нет","Меньше 1 года","1-3 года","Более 3 лет"]

    var body: some View {

        VStack(alignment: .center) {

            Spacer()

            HStack {

                Spacer()

                Text("Опрос")

                Spacer()
            }.padding(.horizontal)

            Spacer()

            Text("2/7").font(.system(size: 12))
                    .frame(width: 50,height: 25).background(Color("Grey-2"))
                    .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical,1)


            DropDownView()
            Spacer()

            Button(action: {

            }){
                Text("Далее").foregroundColor(Color.white).font(.system(size: 12))
            }.frame(width: 200, height: 45).background(Color("ThemeColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical,5)


            Button(action: {

            }){
                Text("Пройти тест позже").foregroundColor(Color("ThemeColor")).font(.system(size: 12))
            }.frame(width: 200, height: 45).background(Color("Grey-2"))
                    .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical,5)

            Spacer()

        }.background(Color("Background")).edgesIgnoringSafeArea(.vertical)
    }
}