//
// Created by JelliedFish on 08.04.2021.
//
import Foundation
import SwiftUI

struct RadioButtonsRisk : View {

    @StateObject var surveyRouter : SurveyRouter
    var fontName : String = "EuclidSquare-Medium"
    var data_first_line = ["Меньше 15%","До 25%"]
    var data_second_line = ["До 50%","До 100%"]


    var body: some View {

        VStack {
            Text("Укажите уровень риска с которым вы готовы работать").font(.custom(fontName,size: 16))
                    .foregroundColor(Color.black)
                    .padding(.bottom,20)
                    .multilineTextAlignment(.center)

            HStack {
                lineWithRadioButtons(data: data_first_line).padding(.leading,75)
                lineWithRadioButtons(data: data_second_line).padding(.trailing,35)
            }

        }.frame(width: 335, height: 210).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.vertical, 5)
    }

    func lineWithRadioButtons(data : [String]) -> some View{
        return VStack(alignment: .leading, spacing: 1) {

            ForEach(data, id: \.self) { i in

                Button(action: {

                    surveyRouter.risk = i

                }) {

                    HStack {

                        ZStack {
                            Circle().fill(surveyRouter.risk == i ? Color("ThemeColor") : Color("Grey-2")).frame(width: 20, height: 20)

                            if surveyRouter.risk == i {

                                Circle().stroke(Color("Grey-2"), lineWidth: 5).frame(width: 19, height: 19)
                            }
                        }.padding(.horizontal, 5)

                        if surveyRouter.risk == i {
                            Text(i).font(.system(size: 12)).foregroundColor(Color("ThemeColor"))
                        }

                        else {
                            Text(i).font(.system(size: 12)).foregroundColor(Color.black)
                        }

                        Spacer()

                    }.frame(width: 130, height: 30)
                            .foregroundColor(.black)

                }.padding(.top,9)

            }
        }
    }
}


