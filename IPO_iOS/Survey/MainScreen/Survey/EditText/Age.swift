//
// Created by JelliedFish on 04.04.2021.
//

import Foundation
import SwiftUI

struct AgeView : View {

    @StateObject var surveyRouter : SurveyRouter
    var fontName : String = "EuclidSquare-Medium"


    var body: some View {

        VStack {
            Text("Сколько вам лет ?").font(.custom(fontName,size: 16))
                    .foregroundColor(Color.black).padding(.top, 35)
                    .multilineTextAlignment(.center)

            VStack(alignment: .center, spacing: 1) {

                VStack(alignment: .center) {


                    if (!isLess18(age: surveyRouter.age)) {

                        VStack(alignment: .leading) {
                            TextField("", text: $surveyRouter.age)
                                    .textFieldStyle(MyTextFieldStyle(less18: isLess18(age: surveyRouter.age)))
                                    .multilineTextAlignment(.center)
                        }.padding(.vertical, 10)

                        Text("Вам должно быть не менее 18 лет!").font(.system(size: 12))
                                .foregroundColor(Color("DarkGrey"))
                                .padding(.bottom, 35)

                    }
                    else {

                        VStack(alignment: .leading) {
                            TextField("", text: $surveyRouter.age)
                                    .textFieldStyle(MyTextFieldStyle(less18: isLess18(age: surveyRouter.age)))
                                    .multilineTextAlignment(.center)
                            .foregroundColor(Color.red)
                        }.padding(.vertical, 10)

                        Text("Вам должно быть не менее 18 лет!")
                                .font(.system(size: 12))
                                .foregroundColor(Color.red)
                                .padding(.bottom, 35)
                    }
                }
            }


        }.frame(width: 335, height: 210).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.vertical, 5)
    }


    func isLess18(age : String) -> Bool {

        if (age.isInt){

            if (Int(age) ?? 17 >= 18 ){

               // surveyRouter.less18 = false

                return false
            }
            else {

               // surveyRouter.less18 = true

                return true
            }
        }
        else {

            //surveyRouter.less18 = true

            return true
        }
    }
}


struct MyTextFieldStyle: TextFieldStyle {
    var less18: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
                .padding(10)
                .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(less18 ? Color.red : Color("Grey-2"), lineWidth: 1)
                ).padding()
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}


