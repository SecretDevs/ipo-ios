//
// Created by Sviatoslav on 31.03.2021.
//

import Foundation
import SwiftUI

struct TableView: View {
    var completedTransactions = [
        CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
        CompletedTransaction(date: "01.03.21", IPO: "Lyft", profit: -14, result: 8090),
        CompletedTransaction(date: "01.03.21", IPO: "Pager Duty", profit: 0, result: 0),
        CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
        CompletedTransaction(date: "01.03.21", IPO: "Lyft", profit: -14, result: 8090),
        CompletedTransaction(date: "01.03.21", IPO: "Pager Duty", profit: 0, result: 0),
        CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
        CompletedTransaction(date: "01.03.21", IPO: "Lyft", profit: -14, result: 8090),
        CompletedTransaction(date: "01.03.21", IPO: "Pager Duty", profit: 0, result: 0),
        CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
        CompletedTransaction(date: "01.03.21", IPO: "Lyft", profit: -14, result: 8090),
        CompletedTransaction(date: "01.03.21", IPO: "Pager Duty", profit: 0, result: 0),
        CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
        CompletedTransaction(date: "01.03.21", IPO: "Lyft", profit: -14, result: 8090),
        CompletedTransaction(date: "01.03.21", IPO: "Pager Duty", profit: 0, result: 0),
        CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
        CompletedTransaction(date: "01.03.21", IPO: "Lyft", profit: -14, result: 8090),
        CompletedTransaction(date: "01.03.21", IPO: "Pager Duty", profit: 0, result: 0)
    ]

    @State private var width: CGFloat = 0
    @State private var height: CGFloat = 0

    var body: some View {
        ZStack {
            HStack {
                HStack {
                    VStack(alignment: .leading, spacing: 25) {
                        Text("Дата")
                                .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                                .foregroundColor(Color("DarkGrey"))
                        ForEach(completedTransactions) { completeTransaction in
                            Text(completeTransaction.date)
                                    .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                                    .foregroundColor(Color("Black"))
                        }
                    }.padding(.trailing, 15)
                    VStack(alignment: .leading, spacing: 25) {
                        Text("IPO")
                                .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                                .foregroundColor(Color("DarkGrey"))
                        ForEach(completedTransactions) { completeTransaction in
                            Text(completeTransaction.IPO)
                                    .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                                    .foregroundColor(Color("Black"))
                        }
                    }
                }
                Spacer()
                HStack {
                    VStack(alignment: .trailing, spacing: 25) {
                        Text("Прибыль %")
                                .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                                .foregroundColor(Color("DarkGrey"))
                        ForEach(completedTransactions) { completeTransaction in
                            Text("\(completeTransaction.profit, specifier: "%.00f")%")
                                    .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                                    .foregroundColor(Color(completeTransaction.profit > 0 ? "Green" : (completeTransaction.profit == 0 ? "Black" : "Red")))
                        }
                    }.padding(.trailing, 15)
                    VStack(alignment: .trailing, spacing: 25) {
                        Text("Результат")
                                .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                                .foregroundColor(Color("DarkGrey"))
                        ForEach(completedTransactions) { completeTransaction in
                            Text("\(completeTransaction.profit < 0 ? "-" : "")$\(completeTransaction.result, specifier: "%.00f")")
                                    .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                                    .foregroundColor(Color("Black"))
                        }
                    }
                }
            }
            VStack(spacing: 12) {
                ForEach((1...completedTransactions.count + 1), id: \.self) {
                    Text("\($0)")
                            .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                            .opacity(0)
                    Rectangle()
                            .fill(Color("Background"))
                            .opacity($0 < completedTransactions.count + 1 ? 1 : 0)
                            .frame(height: 1)
                            .edgesIgnoringSafeArea(.horizontal)

                }
            }.padding(.top, 14)
        }
    }

    func line(atHeight: CGFloat, width: CGFloat, height: CGFloat) -> Path {
        var hLine = Path()
        hLine.move(to: CGPoint(x: 0, y: (atHeight - 0) * height))
        hLine.addLine(to: CGPoint(x: width, y: (atHeight - 0) * height))
        return hLine
    }
}

struct TableRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
