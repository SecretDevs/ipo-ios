//
// Created by JelliedFish on 04.04.2021.
//

import Foundation
import SwiftUI

struct CheckButtons : View {

    @State var selected : [String:Bool] = [
        "Облигации":false,
        "Акции":false,
        "Фьючерсы":false,
        "Опционы":false,
        "IPO":false,
        "Pre-IPO":false,
        "SPAC":false,
        "Ресурсы":false,
    ]

    var data_first_line = ["Облигации","Акции","Фьючерсы","Опционы"]
    var data_second_line = ["IPO","Pre-IPO","SPAC","Ресурсы"]


    var body: some View {

        VStack {
            Text("Какие интсрументы вам интересны ?").font(.system(size: 16))
                    .fontWeight(.regular).foregroundColor(Color.black)
                    .padding(.bottom,20)




        }.frame(width: 335, height: 260).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.vertical, 5)
    }


    func line(data : [String]) -> some View {
        return VStack(alignment: .leading, spacing: 1) {

            ForEach(data, id: \.self) { i in

                HStack {

                    VStack {
                        Button(action: {
                            if (!(self.selected[i] ?? false)) {
                                self.selected[i] = true
                            } else {
                                self.selected[i] = false
                            }
                        }) {

                            HStack {

                                if (self.selected[i] ?? false) {
                                    Image("by_adress_selected").resizable().aspectRatio(contentMode: .fit)
                                    Text(i).font(.body).foregroundColor(Color("ThemeColor"))
                                } else {
                                    Image("by_adress_not_selected").resizable().aspectRatio(contentMode: .fit)
                                    Text(i).font(.body).foregroundColor(Color(Color.black))
                                }


                            }.frame(width: 30, height: 30)
                        }.padding()

                        Spacer()
                    }

                }
            }
        }
    }
}

