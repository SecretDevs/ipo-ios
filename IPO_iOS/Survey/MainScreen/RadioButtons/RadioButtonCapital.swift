//
// Created by JelliedFish on 04.04.2021.
//
import Foundation
import SwiftUI

struct RadioButtonsCapital : View {

    @State var selected : String = "Менее $10 000"
    var data : [String]


    var body: some View {

        VStack {
            Text("Какой у вас объем капитала ?").font(.system(size: 16))
                    .fontWeight(.regular).foregroundColor(Color.black)
                    .padding(.bottom,20)

            VStack(alignment: .leading, spacing: 1) {

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

