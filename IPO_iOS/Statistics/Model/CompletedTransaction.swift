//
// Created by Sviatoslav on 31.03.2021.
//

import Foundation

struct CompletedTransaction : Identifiable {
    var id = UUID().uuidString
    var date : String
    var IPO : String
    var profit : Double
    var result : Double
}

var completedTransactions = [
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
    CompletedTransaction(date: "01.03.21", IPO: "Levi's", profit: 26, result: 14090),
]
