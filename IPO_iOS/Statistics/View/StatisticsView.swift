//
// Created by Sviatoslav on 29.03.2021.
//

import Foundation
import SwiftUI

struct StatisticsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var statisticsViewModel = StatisticsViewModel()

    var body: some View {
        GeometryReader{ geometry in
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

                        Text("").frame(width: 21, height: 21)
                        // Image("search").resizable().renderingMode(.template)
                        //       .frame(width: 21, height: //21).foregroundColor(Color("DarkGrey"))

                    }
                }
                        .padding([.top, .leading, .trailing])
                getContent(width: geometry.size.width, height: geometry.size.height)
            }
                    .onAppear{
                        statisticsViewModel.fetchCompletedTransactions()
                    }
                    .background(Color("Background").edgesIgnoringSafeArea(.top))
                    .navigationBarHidden(true)
        }
    }

    private func getContent(width: CGFloat, height: CGFloat) -> some View {
        switch statisticsViewModel.state {
        case .idle:
            return Color.clear.eraseToAnyView()
        case .loading:
            return VStack{
                ProgressView().scaleEffect(2.0)
            }.frame(width: width, height: height, alignment: .center).eraseToAnyView()
        case .loaded:
            if(statisticsViewModel.completedTransactions.count > 0){
                return GraphView(data: statisticsViewModel.getDayAccounts(), profit: statisticsViewModel.getDayProfit(), statisticsViewModel: _statisticsViewModel, completedTransactions: $statisticsViewModel.completedTransactions, title: "Рост портфеля", legend: "+74%",
                        style: ChartStyle(
                                backgroundColor: .white,
                                accentColor: Color("Blue"),
                                gradientColor: GradientColor(start: Color("Blue").opacity(0.00), end: Color("Blue").opacity(1.00)),
                                backgroundGradientColor: GradientColor(start: Color("Blue").opacity(0.21), end: Color("Blue").opacity(0)),
                                indicatorDotColor: Color("Blue"),
                                textColor: Color("DarkGrey"),
                                legendTextColor: Color("DarkGrey"),
                                fontName: "EuclidSquare-Regular",
                                dropShadowColor: Color("DarkGrey")), legendSpecifier: "%.0f").eraseToAnyView()
            }else{
                return VStack{
                    Text("У вас пока нет завершенных сделок")
                            .font(.custom("EuclidSquare-Medium", size: 16))
                }.frame(width: width, height: height, alignment: .center).eraseToAnyView()
            }
        case .error:
            return VStack{
                Text("Ошибка")
                        .font(.custom("EuclidSquare-Medium", size: 16))
            }.frame(width: width, height: height, alignment: .center).eraseToAnyView()
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
