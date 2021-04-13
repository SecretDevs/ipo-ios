//
// Created by JelliedFish on 09.04.2021.
//

import Foundation
import SwiftUI
import Alamofire



struct CodeView: View {

    @StateObject var codeViewModel = CodeViewModel()
    @ObservedObject var registrationViewModel = RegistrationViewModel()
    @StateObject var registrationRouter : RegistrationRouter
    @StateObject var codeRouter : CodeRouter
    @StateObject var mainScreenRouter : MainScreenRouter

    var fontName : String = "EuclidSquare-Medium"
    var parameters : Parameters {
        [
            "phone_number": Int(mainScreenRouter.phone),
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

            PasscodeField(codeViewModel: codeViewModel, codeRouter: codeRouter, registrationRouter: registrationRouter, mainScreenRouter: mainScreenRouter).padding(.top,60)

            Spacer()




                if (codeViewModel.state == .CORRECT) {
                    Button(action: {

                    }) {
                        Text("Отправить код еще раз").foregroundColor(Color("DarkGrey")).font(.system(size: 12)).frame(width: 200, height: 45).background(Color("Grey-2"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }.padding(.vertical, 5)


                    Button(action: {

                        mainScreenRouter.index += 1

                    }) {
                        Text("Далее").foregroundColor(Color.white).font(.system(size: 12)).frame(width: 200, height: 45).background(Color("ThemeColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }.padding(.vertical, 5)

                }

            else {

                Button(action: {
                    registrationViewModel.requestCode(parameters: parameters)
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

        }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
                .background(Color("Background"))
                .edgesIgnoringSafeArea(.vertical)
    }
}
