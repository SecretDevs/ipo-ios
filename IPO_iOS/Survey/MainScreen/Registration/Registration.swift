//
// Created by JelliedFish on 08.04.2021.
//

//
// Created by JelliedFish on 04.04.2021.
//

//
// Created by JelliedFish on 03.04.2021.
//

import Foundation
import SwiftUI


struct Registration : View {

    var fontName : String = "EuclidSquare-Medium"
    @State var correctNumber : Bool = true
    @StateObject var mainScreenRouter: MainScreenRouter

    var body: some View {

        VStack(alignment: .center) {


            HStack {

                Button(action: {

                }){
                    Image("Arrow").resizable().frame(width: 7.5, height: 15)
                }.padding(.leading,21)


                Spacer()

                Text("Регистрация").font(.custom(fontName,size: 19))
                        .padding(.trailing,35)


                Spacer()
            }.padding(.horizontal)
            .padding(.top,60)

            Spacer()


            PhoneNumberView().padding(.top,60)




            Spacer()

            Button(action: {

                    mainScreenRouter.index += 1

            }){

                    Text("Отправить код").foregroundColor(correctNumber ? Color.white : Color("DarkGrey"))
                            .font(.system(size: 12))

            }.frame(width: 200, height: 45).background(correctNumber ?  Color("ThemeColor"):Color("Grey-2"))
                    .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical,5)

            Spacer()

        }.background(Color("Background")).edgesIgnoringSafeArea(.vertical)
    }
}