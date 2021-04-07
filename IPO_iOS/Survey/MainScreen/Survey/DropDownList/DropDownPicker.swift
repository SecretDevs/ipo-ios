
//
// Created by Sviatoslav on 07.04.2021.
//

import Foundation
import SwiftUI

struct DropDownPicker: View {
    var fontName : String = "EuclidSquare-Medium"
    @State private var selection = "Выберите вариант..."
    @State private var isExpanded = false
    @State private var selectedIndex = -1
    private var variants = ["Сбережение", "Основной доход", "Дополнительный доход"]
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Text("Укажите вашу основную цель работы с фондовым рынком?")
                        .font(.custom(fontName,size: 16))
                        .padding(.top, 37)
                        .padding(.horizontal, 25)
                Spacer()
            }.frame(width: 335, height: 210).background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            VStack {
                Text("Укажите вашу основную цель работы с фондовым рынком?")
                        .font(.custom(fontName,size: 16))
                        .padding(.top, 37)
                        .padding(.horizontal, 25)
                VStack{
                    DisclosureGroup("\(selection)", isExpanded: $isExpanded) {
                        VStack(spacing: 15){
                            ForEach(0...2, id: \.self){ index in
                                HStack {
                                    Button(action: {
                                        isExpanded = false
                                        selection = variants[index]
                                        selectedIndex = index
                                    }) {
                                        Text(variants[index]).foregroundColor(selectedIndex == index ? Color("Blue") : Color("Black"))
                                                .font(.custom(fontName,size: 16))
                                    }
                                    Spacer()
                                }
                            }
                        }.padding(.top, 20)
                    }
                            .frame(width: 260)
                            .accentColor(Color("Blue"))
                            .foregroundColor(selectedIndex == -1 ? Color("DarkGrey") : Color("Black"))
                            .font(.custom(fontName,size: 16))
                            .padding(.all)
                            .background(Color.white)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("Grey-2"), lineWidth: 2))
                }.padding(.top, 41)
                Spacer()
            }.frame(width: 335, height: 341)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
        }
                .padding(.vertical, 5)
    }
}
