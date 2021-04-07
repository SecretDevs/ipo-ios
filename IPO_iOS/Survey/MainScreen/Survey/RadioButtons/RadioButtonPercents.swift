//
// Created by JelliedFish on 07.04.2021.
//

import SwiftUI

struct RadioButtonsPercents : View {

    @State var selected : String = "15%"
    var data_first_line = ["15%","25%","50%"]
    var data_second_line = ["100%","более 100%"]


    var body: some View {

        VStack {
            Text("Укажите целевой уровень годовой доходности по портфелю ?").font(.system(size: 16))
                    .fontWeight(.regular).foregroundColor(Color.black)
                    .padding(.bottom,20)
                    .multilineTextAlignment(.center)

            HStack(alignment: .top) {
                lineWithRadioButtons(data: data_first_line).padding(.leading,75)
                lineWithRadioButtons(data: data_second_line).padding(.trailing,45)
            }

        }.frame(width: 335, height: 260).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.vertical, 5)
    }

    func lineWithRadioButtons(data : [String]) -> some View{
        return VStack(alignment: .leading, spacing: 1) {

            ForEach(data, id: \.self) { i in

                Button(action: {

                    self.selected = i

                }) {

                    HStack {

                        ZStack {
                            Circle().fill(self.selected == i ? Color("ThemeColor") : Color("Grey-2")).frame(width: 20, height: 20)

                            if self.selected == i {

                                Circle().stroke(Color("Grey-2"), lineWidth: 5).frame(width: 19, height: 19)
                            }
                        }.padding(.horizontal, 5)

                        if self.selected == i {
                            Text(i).font(.system(size: 12)).foregroundColor(Color("ThemeColor"))
                        }

                        else {
                            Text(i).font(.system(size: 12)).foregroundColor(Color.black)
                        }

                        Spacer()

                    }.frame(width: 120, height: 30)
                            .foregroundColor(.black)

                }.padding(.top,9)

            }
        }
    }
}


