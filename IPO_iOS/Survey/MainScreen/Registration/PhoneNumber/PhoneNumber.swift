//
// Created by JelliedFish on 08.04.2021.
//

import Foundation
import SwiftUI
import iPhoneNumberField


struct PhoneNumberView : View {


    @StateObject var registrationRouter : RegistrationRouter
    @State var isCorrect: Bool = false
    @State var isEditing: Bool = false
    @State var isEditingFirst: Bool = false


    var fontName : String = "EuclidSquare-Medium"
    @State var colorClear : Bool = false
    var body: some View {

        VStack {
            Text("Введите ваш номер телефона").font(.custom(fontName,size: 16))
                    .fontWeight(.regular).foregroundColor(Color.black).padding(.top, 35)
                    .multilineTextAlignment(.center)

            VStack(alignment: .center, spacing: 1) {

                VStack(alignment: .center) {



                        VStack(alignment: .leading) {
                            ZStack {
                                
                                if (!isEditing) && (registrationRouter.number == "+") {
                                    Text("+7 999 123-45-67").foregroundColor(Color("DarkGrey"))
                                }
                                else {
                                    Text("")
                                }

                                
                                iPhoneNumberField("+7 999 123-45-67", text: $registrationRouter.number, isEditing: $isEditing)
                                    .onEditingBegan(){ _ in
                                        isEditingFirst = true
                                        print(registrationRouter.number)

                                    }
                                    .onEdit(perform: { _ in
                                        print(registrationRouter.number)
                                    })
                                            .onEditingEnded(){ _ in
                                                if(registrationRouter.number.count <= 2) ||
                                                    (registrationRouter.number == "+"){
                                                    
                                                    print(registrationRouter.number.count)
                                                    
                                                    registrationRouter.number = "+"
                                                    
                                                    isEditingFirst = false
                                                }
                                                
                                                
                                            isCorrect = registrationRouter.isCorrect()
                                        }
                                            
                                
                                        .foregroundColor((!isEditingFirst ?
                                                            Color.clear
                                                            : isEditing ? registrationRouter.isCorrect() ? Color("ThemeColor") : Color.red : Color.black))
                                        .multilineTextAlignment(.center)
                                        .prefixHidden(false)
                                        .padding(10)
                                    .accentColor((isEditing ? registrationRouter.isCorrect() ? Color("ThemeColor") : Color.red : Color.black))
                                        .background(
                                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                        .stroke((isEditing ? registrationRouter.isCorrect() ? Color("ThemeColor") : Color.red : Color("Grey-2")), lineWidth: 1)
                                        ).padding()


                            }

                        }.padding(.vertical, 10)
                    




                    HStack {
                            Button(action: {

                                if (!(registrationRouter.checked)) {
                                    registrationRouter.checked = true
                                } else {
                                    registrationRouter.checked = false
                                }

                            }) {
                                if (registrationRouter.checked){
                                    Image("Check").resizable().aspectRatio(contentMode: .fit).frame(width: 24, height: 24)
                                    Text("Я ознакомлен с условиями и принимаю их").font(.system(size: 12))
                                            .foregroundColor(Color("ThemeColor"))
                                }
                                else {
                                    Image("Uncheck").resizable().aspectRatio(contentMode: .fit).frame(width: 24, height: 24)
                                    Text("Я ознакомлен с условиями и принимаю их").font(.system(size: 12))
                                            .foregroundColor(Color.black)
                                }
                            }.padding(.bottom,35)

                    }.frame(width: 310, height: 30)

                }
            }


        }.onTapGesture {
            UIApplication.shared.endEditing()
        }
        .frame(width: 335, height: 210).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.vertical, 5)
    }
}

