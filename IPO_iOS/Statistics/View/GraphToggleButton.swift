//
// Created by Sviatoslav on 31.03.2021.
//

import Foundation

import SwiftUI

struct GraphToggleButton: View {

    @ObservedObject var graphData: ChartData;

    var body: some View {
        ZStack {
            HStack {

                HStack {

                    Button(action: {
                        graphData.setPoints(points: [12, 5, 6, 9, 1, 20]);
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
                        graphData.setPoints(points: [1, 50, 3, 2, 4, 20, 50]);
                        graphData.index = 1;
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
                        graphData.setPoints(points: [12, 5, 6, 9, 1, 20, 40, 60, 3]);
                        graphData.index = 2;
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
                        graphData.setPoints(points: [12, 5, 6, 9, 1, 20, 80, 90, 100, 35]);
                        graphData.index = 3;
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
                        graphData.setPoints(points: [12, 5, 6, 9, 1, 20, 200, 300, 500, 1000]);
                        graphData.index = 4;
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
