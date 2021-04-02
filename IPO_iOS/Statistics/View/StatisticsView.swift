//
// Created by Sviatoslav on 29.03.2021.
//

import Foundation
import SwiftUI
import SwiftUICharts

struct StatisticsView: View {

    var body: some View {
        GraphView(data: [12, 5, 6, 9, 1, 20], title: "Рост портфеля", legend: "+74%",
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
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
