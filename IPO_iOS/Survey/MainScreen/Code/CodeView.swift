//
// Created by JelliedFish on 09.04.2021.
//

import Foundation
import SwiftUI
import Alamofire



struct CodeView: View {

    @ObservedObject var codeViewModel = CodeViewModel()
    @StateObject var registrationRouter : RegistrationRouter
    @StateObject var codeRouter : CodeRouter
    @StateObject var mainScreenRouter : MainScreenRouter

    var fontName : String = "EuclidSquare-Medium"
    var parameters : Parameters {
        [
            "phone_number": Int(mainScreenRouter.phone),
            "sms_code" : Int(codeRouter.code)
        ]
    }

    var body: some View {
        VStack(alignment: .center) {

            HStack {

                Button(action: {

                     mainScreenRouter.index -= 1

                }){
                    Image("Arrow").resizable().frame(width: 7.5, height: 15)
                }.padding(.leading,21)

                Spacer()

                Text("Регистрация").font(.custom(fontName,size: 19))
                        .padding(.trailing,33)

                Spacer()
            }.padding(.horizontal)
                    .padding(.top,60)

            Spacer()

            PasscodeField(codeRouter: codeRouter, registrationRouter: registrationRouter).padding(.top,60)

            Spacer()




                if (codeRouter.isRight) {
                    Button(action: {

                    }) {
                        Text("Отправить код еще раз").foregroundColor(Color("DarkGrey")).font(.system(size: 12)).frame(width: 200, height: 45).background(Color("Grey-2"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }.padding(.vertical, 5)


                    Button(action: {

                        mainScreenRouter.index += 1
                        codeViewModel.checkCode(parameters: parameters)
                    }) {
                        Text("Далее").foregroundColor(Color.white).font(.system(size: 12)).frame(width: 200, height: 45).background(Color("ThemeColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }.padding(.vertical, 5)

                }

            else {

                Button(action: {

                }) {
                    Text("Отправить код еще раз").foregroundColor(Color("ThemeColor")).font(.system(size: 12)).frame(width: 200, height: 45).background(Color("Grey-2"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }.padding(.vertical, 5)


                Button(action: {

                    mainScreenRouter.index += 1

                }) {
                    Text("Далее").foregroundColor(Color("DarkGrey")).font(.system(size: 12)).frame(width: 200, height: 45).background(Color("Grey-2"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }.padding(.vertical, 5)

            }

            Spacer()

        }.background(Color("Background")).edgesIgnoringSafeArea(.vertical)
    }
}
