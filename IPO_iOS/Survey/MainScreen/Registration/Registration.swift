//
// Created by JelliedFish on 08.04.2021.
//


import Foundation
import SwiftUI
import Alamofire


struct Registration: View {

    @ObservedObject var registrationViewModel = RegistrationViewModel()
    @StateObject var registrationRouter: RegistrationRouter
    @StateObject var mainScreenRouter: MainScreenRouter
    @State var correctNumber: Bool = true

    var fontName: String = "EuclidSquare-Medium"
    var parameters : Parameters {
        [
            "phone_number": registrationRouter.number.phoneNumber
        ]
    }

    var body: some View {

        VStack(alignment: .center, content: {

            HStack {

                Button(action: {

                }) {
                    Image("Arrow").resizable().frame(width: 7.5, height: 15)
                }.padding(.leading, 21)

                Spacer()

                Text("Регистрация").font(.custom(fontName, size: 19))
                        .padding(.trailing, 35)

                Spacer()
            }
                    .padding(.horizontal)
                    .padding(.top, 60)

            Spacer()

            PhoneNumberView(registrationRouter: registrationRouter).padding(.top, 60)

            Spacer()

            if ((registrationRouter.checked) && (registrationRouter.isCorrect())) {

                Button(action: {
                    mainScreenRouter.index += 1
                    mainScreenRouter.phone = registrationRouter.number.phoneNumber
                    registrationViewModel.requestCode(parameters: parameters)
                }) {

                    Text("Отправить код").foregroundColor(correctNumber ? Color.white : Color("DarkGrey"))
                            .font(.system(size: 12)).frame(width: 200, height: 45).background(correctNumber ? Color("ThemeColor") : Color("Grey-2"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))

                }.padding(.vertical, 5)

            } else {

                Button(action: {


                }) {

                    Text("Отправить код").foregroundColor(Color("DarkGrey"))
                            .font(.system(size: 12))
                        .frame(width: 200, height: 45).background(Color("Grey-2"))
                                .clipShape(RoundedRectangle(cornerRadius: 15))

                }.padding(.vertical, 5)

            }

            Spacer()

        })
        .background(Color("Background")).edgesIgnoringSafeArea(.vertical)
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
