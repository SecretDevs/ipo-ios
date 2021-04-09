//
// Created by JelliedFish on 04.04.2021.
//
import Foundation
import SwiftUI

struct RadioButtonsCapital : View {

    @StateObject var surveyRouter : SurveyRouter
    var fontName : String = "EuclidSquare-Medium"
    var data : [String] = ["Менее $10 000","$10 000 - $50 000","$50 000 - $250 000","Более $250 000"]


    var body: some View {

        VStack {
            Text("Какой у вас объем капитала ?").font(.custom(fontName,size: 16))
                    .foregroundColor(Color.black)
                    .padding(.bottom,20)
                    .multilineTextAlignment(.center)

            VStack(alignment: .leading, spacing: 1) {

                ForEach(data, id: \.self) { i in

                    Button(action: {

                        surveyRouter.capital = i

                    }) {

                        HStack {

                            ZStack {
                                Circle().fill(surveyRouter.capital == i ? Color("ThemeColor") : Color("Grey-2")).frame(width: 20, height: 20)

                                if surveyRouter.capital == i {

                                    Circle().stroke(Color("Grey-2"), lineWidth: 5).frame(width: 19, height: 19)
                                }
                            }.padding(.horizontal, 5)

                            if surveyRouter.capital == i {
                                Text(i).font(.system(size: 12)).foregroundColor(Color("ThemeColor"))
                            }

                            else {
                                Text(i).font(.system(size: 12)).foregroundColor(Color.black)
                            }

                            Spacer()

                        }.frame(width: 215)
                                .foregroundColor(.black)
                                .padding(.horizontal)

                    }.padding(.top,9).padding(.leading, 70)
                }
            }
        }.frame(width: 335, height: 260).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.vertical, 5)
    }
}

