//
// Created by JelliedFish on 04.04.2021.
//

//
// Created by JelliedFish on 03.04.2021.
//

import Foundation
import SwiftUI


struct MainSurveyView: View {
    var data1 =  ["Менее $10 000","$10 000 - $50 000","$50 000 - $250 000","Более $250 000"]

    @StateObject var surveyRouter : SurveyRouter
    @State private var selectedStrength = "Mild"
    let strengths = ["Mild", "Medium", "Mature"]

    var body: some View {
        VStack(alignment: .center) {

            HStack {

                Button(action: {

                    if ( surveyRouter.index > 1) {
                        surveyRouter.index -= 1
                    }

                }){
                    Image("Arrow").resizable().frame(width: 7.5, height: 15)
                }.padding(.leading,21)

                Spacer()

                Text("Опрос").padding(.trailing,33)

                Spacer()
            }.padding(.horizontal)
            .padding(.top,60)

            Spacer()

            Text(String(surveyRouter.index)+"/7").font(.system(size: 12))
                    .frame(width: 50,height: 25).background(Color("Grey-2"))
                    .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.vertical,1)

            parseView()

            Spacer()

            Button(action: {

                if (surveyRouter.index < 7) {
                    surveyRouter.index += 1
                }

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

    func parseView() -> some View{
        return VStack{

            switch(surveyRouter.index){

            case 1:
                AgeView()


            case 2:
                RadioButtonsCapital()


            case 3:
                RadioButtonsExp()


            case 4:
                CheckButtons()


            case 5:
                DropDownView()


            case 6:
                RadioButtonsPercents()


            case 7:
                RadioButtonsRisk()

            default:
                AgeView()
            }


        }.padding(.top, 60)
    }
}