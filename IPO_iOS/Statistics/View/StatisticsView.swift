//
// Created by Sviatoslav on 29.03.2021.
//

import Foundation
import SwiftUI
import SwiftUICharts

struct StatisticsView : View {

    var body: some View {
        VStack{
            LineChartView(data: [12, 5, 6, 9, 1, 15], title: "Рост портфеля", legend: "Full screen", form: ChartForm.large)

        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
