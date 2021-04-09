//
// Created by JelliedFish on 04.04.2021.
//

//
// Created by JelliedFish on 03.04.2021.
//

import Foundation
import SwiftUI


struct MainSurveyView: View {

    var fontName : String = "EuclidSquare-Medium"
    @StateObject var surveyRouter : SurveyRouter
    @StateObject var mainScreenRouter : MainScreenRouter

    var body: some View {
        VStack(alignment: .center) {

            VStack {
                HStack {

                    Button(action: {

                        if (surveyRouter.index > 1) {
                            surveyRouter.index -= 1
                        } else {
                            mainScreenRouter.index -= 1
                        }

                    }) {
                        Image("Arrow").resizable().frame(width: 7.5, height: 15)
                    }.padding(.leading, 21)

                    Spacer()

                    Text("Опрос").font(.custom(fontName, size: 19))
                            .padding(.trailing, 33)

                    Spacer()
                }.padding(.horizontal)
                        .padding(.top, 60)

                Spacer()

                if (surveyRouter.index != 5) {
                    Text(String(surveyRouter.index) + "/7").font(.system(size: 12))
                            .frame(width: 50, height: 25).background(Color("Grey-2"))
                            .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical, 1)
                }
                else {

                    Text(String(surveyRouter.index) + "/7").font(.system(size: 12))
                            .frame(width: 50, height: 25).background(Color("Grey-2"))
                            .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.top,65)
                }

                parseView()

                Spacer()

            }.frame(height: 640)

            if (surveyRouter.index == 1) {
                if (!surveyRouter.isLess18()) {

                    Button(action: {

                        if (surveyRouter.index < 7) {
                            surveyRouter.index += 1
                        }

                    }) {
                        Text("Далее").foregroundColor(Color.white).font(.system(size: 12))
                    }.frame(width: 200, height: 45).background(Color("ThemeColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical, 5)


                } else {
                    Button(action: {


                    }) {
                        Text("Далее").foregroundColor(Color("DarkGrey")).font(.system(size: 12))
                    }.frame(width: 200, height: 45).background(Color("Grey-2"))
                            .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical, 5)
                }
            }

            if (surveyRouter.index == 5) {
                if (surveyRouter.hasChosen()) {

                    Button(action: {

                        if (surveyRouter.index < 7) {
                            surveyRouter.index += 1
                        }

                    }) {
                        Text("Далее").foregroundColor(Color.white).font(.system(size: 12))
                    }.frame(width: 200, height: 45).background(Color("ThemeColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical, 5)


                } else {
                    Button(action: {


                    }) {
                        Text("Далее").foregroundColor(Color("DarkGrey")).font(.system(size: 12))
                    }.frame(width: 200, height: 45).background(Color("Grey-2"))
                            .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical, 5)
                }
            }

            if ((surveyRouter.index != 5) && (surveyRouter.index != 1)) {

                    Button(action: {

                        if (surveyRouter.index < 7) {
                            surveyRouter.index += 1
                        }
                        else{
                            mainScreenRouter.index += 1
                        }

                    }) {
                        Text("Далее").foregroundColor(Color.white).font(.system(size: 12))
                    }.frame(width: 200, height: 45).background(Color("ThemeColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical, 5)

            }



            Button(action: {
                mainScreenRouter.index = 4
            }){
                Text("Пройти тест позже").foregroundColor(Color("ThemeColor")).font(.system(size: 12))
            }.frame(width: 200, height: 45).background(Color("Grey-2"))
                    .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical,5)

            Spacer()

        }.background(Color("Background")).edgesIgnoringSafeArea(.vertical)
    }

    func parseView() -> some View{
        return VStack{

            switch(surveyRouter.index){

            case 1:
                AgeView(surveyRouter: surveyRouter)


            case 2:
                RadioButtonsCapital(surveyRouter: surveyRouter)


            case 3:
                RadioButtonsExp(surveyRouter: surveyRouter)


            case 4:
                CheckButtons(surveyRouter: surveyRouter)


            case 5:
                DropDownPicker(surveyRouter: surveyRouter).padding(.top,65)


            case 6:
                RadioButtonsPercents(surveyRouter: surveyRouter)


            case 7:
                RadioButtonsRisk(surveyRouter: surveyRouter)

            default:
                AgeView(surveyRouter: surveyRouter)
            }


        }.padding(.top, 60)
    }
}