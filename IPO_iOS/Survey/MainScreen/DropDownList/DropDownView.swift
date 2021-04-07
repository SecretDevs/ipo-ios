//
// Created by JelliedFish on 07.04.2021.
//

import Foundation
import SwiftUI

struct DropDownView: View {

    @State var expand: Bool = false
    @State var title : String = "Выберите вариант..."
    @State var index: Int = 3

    var body: some View {
        VStack {

            VStack {
                HStack {
                    if (expand) {
                        Text("Выберите вариант...").font(.system(size: 14)).foregroundColor(Color("DarkGrey"))
                    }
                    else {
                        if (index == 3){
                            Text("Выберите вариант...").font(.system(size: 14)).foregroundColor(Color("DarkGrey"))
                        }
                        else {
                            Text(self.title).font(.system(size: 17)).foregroundColor(Color.black)
                        }

                    }

                    Spacer()

                    if (expand) {
                        Image(systemName: "chevron.up").resizable().frame(width: 16, height: 8)
                                .font(Font.title.weight(.bold))
                    } else {
                        Image(systemName: "chevron.down").resizable().frame(width: 8, height: 16)
                                .font(Font.title.weight(.bold))
                    }
                }       .frame(width: 285, height: 45)
                        .onTapGesture {
                            self.expand.toggle()
                        }

                if expand {
                    ZStack {
                        VStack(alignment: .leading) {

                            HStack {

                                Button(action: {

                                    index = 0
                                    title = "Сбережение"

                                }) {
                                    if index == 0 {
                                        Text("Сбережение").foregroundColor(Color("ThemeColor"))
                                    }
                                    else {
                                        Text("Сбережение").foregroundColor(Color.black)
                                    }
                                }
                                Spacer()

                            }.padding(.leading, 10)
                                    .padding(.vertical, 8)

                            HStack {

                                Button(action: {

                                    index = 1
                                    title = "Основной доход"


                                }) {
                                    if index == 1 {
                                        Text("Основной доход").foregroundColor(Color("ThemeColor"))
                                    }
                                    else {
                                        Text("Основной доход").foregroundColor(Color.black)
                                    }
                                }
                                Spacer()

                            }.padding(.leading, 10)
                                    .padding(.vertical, 8)

                            HStack {

                                Button(action: {

                                    index = 2
                                    title = "Дополнительный доход"


                                }) {
                                    if index == 2 {

                                        Text("Дополнительный доход").foregroundColor(Color("ThemeColor"))

                                    }
                                    else {

                                        Text("Дополнительный доход").foregroundColor(Color.black)

                                    }
                                }
                                Spacer()

                            }.padding(.leading, 10)
                                    .padding(.vertical, 8)

                        }

                    }
                }

            }
                    .padding(.horizontal)
                    .padding(.bottom, 4)
                    .padding(.top, 4)
                    .background(Color.white)
                    .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color("DarkGrey"), lineWidth: 2))

        }.frame(width: 335, height: 210).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.vertical, 5)
    }
}

struct DropDownItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}