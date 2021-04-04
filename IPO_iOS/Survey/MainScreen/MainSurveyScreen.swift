//
// Created by JelliedFish on 03.04.2021.
//

import Foundation
import SwiftUI


struct MainSurveyScreen : View {


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
                    .frame(width: 50,height: 25).background(Color("Grey"))
                    .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical,1)


            RadioButtons()

            Spacer()

            Button(action: {

            }){
                Text("Далее").foregroundColor(Color.white)
            }.frame(width: 200, height: 45).background(Color("ThemeColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical,5)


            Button(action: {

            }){
                Text("Пройти тест позже").foregroundColor(Color("ThemeColor"))
            }.frame(width: 200, height: 45).background(Color("Grey"))
                    .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical,5)

            Spacer()

        }.background(Color("Background")).edgesIgnoringSafeArea(.vertical)
    }
}