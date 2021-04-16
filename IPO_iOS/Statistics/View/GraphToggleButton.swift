//
// Created by Sviatoslav on 31.03.2021.
//

import Foundation

import SwiftUI

struct GraphToggleButton: View {

    @ObservedObject var graphData: ChartData
    @StateObject var statisticsViewModel : StatisticsViewModel

    var body: some View {
        ZStack {
            HStack {

                HStack {

                    Button(action: {
                        graphData.setPoints(points: statisticsViewModel.getDayAccounts());
                        graphData.setProfit(profit: statisticsViewModel.getDayProfit())
                        graphData.index = 0;
                    }) {
                        VStack{
                            Text("День")
                                    .font(.custom("EuclidSquare-Regular", size: 12))
                                    .foregroundColor(graphData.index != 0 ? Color("DarkGrey") : .white)
                                    .padding(10)
                        }
                                .background(graphData.index != 0 ? Color("Background") : Color("Blue"))
                                .cornerRadius(10)
                    }

                    Spacer()

                    Button(action: {
                        graphData.setPoints(points: statisticsViewModel.getWeekAccounts())
                        graphData.setProfit(profit: statisticsViewModel.getWeekProfit())
                        graphData.index = 1
                    }) {

                        VStack{
                            Text("Нед.")
                                    .font(.custom("EuclidSquare-Regular", size: 12))
                                    .foregroundColor(graphData.index != 1 ? Color("DarkGrey") : .white)
                                    .padding(10)
                        }
                                .background(graphData.index != 1 ? Color("Background") : Color("Blue"))
                                .cornerRadius(10)
                    }

                    Spacer()

                    Button(action: {
                        graphData.setPoints(points: statisticsViewModel.getMonthAccounts())
                        graphData.setProfit(profit: statisticsViewModel.getMonthProfit())
                        graphData.index = 2
                    }) {

                        VStack{
                            Text("Мес.")
                                    .font(.custom("EuclidSquare-Regular", size: 12))
                                    .foregroundColor(graphData.index != 2 ? Color("DarkGrey") : .white)
                                    .padding(10)
                        }
                                .background(graphData.index != 2 ? Color("Background") : Color("Blue"))
                                .cornerRadius(10)
                    }

                    Spacer()

                    Button(action: {
                        graphData.setPoints(points: statisticsViewModel.getYearAccounts())
                        graphData.setProfit(profit: statisticsViewModel.getYearProfit())
                        graphData.index = 3
                    }) {

                        VStack{
                            Text("Год")
                                    .font(.custom("EuclidSquare-Regular", size: 12))
                                    .foregroundColor(graphData.index != 3 ? Color("DarkGrey") : .white)
                                    .padding(10)
                        }
                                .background(graphData.index != 3 ? Color("Background") : Color("Blue"))
                                .cornerRadius(10)
                    }

                    Spacer()

                    Button(action: {
                        graphData.setPoints(points: statisticsViewModel.getAccounts())
                        graphData.setProfit(profit: statisticsViewModel.getProfit())
                        graphData.index = 4
                    }) {

                        VStack{
                            Text("Все")
                                    .font(.custom("EuclidSquare-Regular", size: 12))
                                    .foregroundColor(graphData.index != 4 ? Color("DarkGrey") : .white)
                                    .padding(10)
                        }
                                .background(graphData.index != 4 ? Color("Background") : Color("Blue"))
                                .cornerRadius(10)
                    }

                }
                        .padding(.top, 27)
                        .padding(.bottom, 13)
                        .padding(.horizontal, 13)

            }
        }
    }
}

struct GraphToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
