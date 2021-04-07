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
                    .multilineTextAlignment(.center)

            HStack {
                lineWithCheckButtons(data: data_first_line).padding(.leading, 35)
                lineWithCheckButtons(data: data_second_line).padding(.leading,25)
            }


        }.frame(width: 335, height: 260).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.vertical, 5)
    }


    func lineWithCheckButtons(data : [String]) -> some View {
        return VStack(alignment: .leading) {

            ForEach(data, id: \.self) { i in


                        Button(action: {
                            if (!(self.selected[i] ?? false)) {
                                self.selected[i] = true
                            } else {
                                self.selected[i] = false
                            }
                        }) {

                            HStack {


                                if (self.selected[i] ?? false) {
                                    Image("Check").resizable().aspectRatio(contentMode: .fit).frame(width: 24, height: 24)
                                    Text(i).font(.system(size: 14)).foregroundColor(Color("ThemeColor"))
                                } else {
                                    Image("Uncheck").resizable().aspectRatio(contentMode: .fit).frame(width: 24, height: 24)
                                    Text(i).font(.system(size: 14)).foregroundColor(Color.black)
                                }

                                Spacer()
                            }.frame(width: 120, height: 30)
                }
            }
        }
    }
}

