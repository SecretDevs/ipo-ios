//
// Created by Sviatoslav on 31.03.2021.
//

import Foundation
import SwiftUI

struct GraphView: View {

    var body: some View {
        GeometryReader{ geometry in
            VStack {
                LineViewV2(data: [12, 5, 6, 9, 1, 20], title: "Рост портфеля", legend: "+74%",
                        style: ChartStyle(
                                backgroundColor: .white,
                                accentColor: Color("Blue"),
                                gradientColor: GradientColor(start: Color("Blue").opacity(0.00), end: Color("Blue").opacity(1.00)),
                                backgroundGradientColor: GradientColor(start: Color("Blue").opacity(0.21), end: Color("Blue").opacity(0)),
                                indicatorDotColor: Color("Blue"),
                                textColor: Color("DarkGrey"),
                                legendTextColor: Color("DarkGrey"),
                                fontName: "EuclidSquare-Regular",
                                dropShadowColor: Color("DarkGrey")))
                .frame(width: geometry.frame(in: .local).width, height: geometry.frame(in: .local).height)
            }
                    //.background(self.colorScheme == .dark ? self.darkModeStyle.backgroundColor : self.style.backgroundColor)
                    .cornerRadius(15)
                    .shadow(color: Color("DarkGrey"), radius: true ? 8 : 0)
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
