//
// Created by Sviatoslav on 29.03.2021.
//

import Foundation
import SwiftUI

struct StatisticsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var statisticsViewModel = StatisticsViewModel()

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("Arrow").resizable().renderingMode(.template)
                            .frame(width: 7.5, height: 15).foregroundColor(Color("DarkGrey"))
                }
                Spacer()
                Text("Статистика")
                        .font(.custom("EuclidSquare-Medium", size: 18))
                        .foregroundColor(Color("Black"))
                Spacer()
                Button(action: {
                    //TODO
                }) {
                    Image("search").resizable().renderingMode(.template)
                            .frame(width: 21, height: 21).foregroundColor(Color("DarkGrey"))
                }
            }
                    .padding([.top, .leading, .trailing])
            GraphView(data: statisticsViewModel.getDayAccounts(), profit: statisticsViewModel.getDayProfit(), statisticsViewModel: _statisticsViewModel, completedTransactions: $statisticsViewModel.completedTransactions, title: "Рост портфеля", legend: "+74%",
                    style: ChartStyle(
                            backgroundColor: .white,
                            accentColor: Color("Blue"),
                            gradientColor: GradientColor(start: Color("Blue").opacity(0.00), end: Color("Blue").opacity(1.00)),
                            backgroundGradientColor: GradientColor(start: Color("Blue").opacity(0.21), end: Color("Blue").opacity(0)),
                            indicatorDotColor: Color("Blue"),
                            textColor: Color("DarkGrey"),
                            legendTextColor: Color("DarkGrey"),
                            fontName: "EuclidSquare-Regular",
                            dropShadowColor: Color("DarkGrey")), legendSpecifier: "%.0f")
        }
                .background(Color("Background").edgesIgnoringSafeArea(.top))
                .navigationBarHidden(true)
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
