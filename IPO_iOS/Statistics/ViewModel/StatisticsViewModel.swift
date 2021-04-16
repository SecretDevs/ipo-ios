//
// Created by Sviatoslav on 11.04.2021.
//

import Foundation
import Combine

class StatisticsViewModel: ObservableObject {
    @Published var completedTransactions : [CompletedTransaction] = []
    var cancellation: AnyCancellable?

    /*init() {
        fetchCompletedTransactions()
    }*/

    func fetchCompletedTransactions() {
        cancellation = StatisticsAPI.fetchStatistics()
                .mapError({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: { _ in }, receiveValue: { response in
                    print(response.completedTransactions)
                    /*let isoDateFormatter = ISO8601DateFormatter()
                    isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                    isoDateFormatter.formatOptions = [
                        .withFullDate,
                        .withFullTime,
                        .withDashSeparatorInDate,
                        .withFractionalSeconds
                    ]
                    print(Date().timeIntervalSince1970 - isoDateFormatter.date(from: response.completedTransactions.last!.date)!.timeIntervalSince1970)*/
                    self.completedTransactions = response.completedTransactions
                })
    }

    func getAccounts() -> [Double] {
        return completedTransactions.map {
            Double($0.account)
        }
    }

    func getDayAccounts() -> [Double] {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds
        ]
        let dayTimeInterval = 24*60*60
        var answer : [CompletedTransaction] = []
        for transaction in completedTransactions{
            if(Int(Date().timeIntervalSince1970) - Int(isoDateFormatter.date(from: transaction.date)!.timeIntervalSince1970) < dayTimeInterval){
                answer.append(transaction)
            }
        }
        return answer.map {
            return Double($0.account)
        }
    }

    func getWeekAccounts() -> [Double] {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds
        ]
        let weekTimeInterval = 7*24*60*60
        var answer : [CompletedTransaction] = []
        for transaction in completedTransactions{
            if(Int(Date().timeIntervalSince1970) - Int(isoDateFormatter.date(from: transaction.date)!.timeIntervalSince1970) < weekTimeInterval){
                answer.append(transaction)
            }
        }
        return answer.map {
            return Double($0.account)
        }
    }

    func getMonthAccounts() -> [Double] {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds
        ]
        let monthTimeInterval = 31*24*60*60
        var answer : [CompletedTransaction] = []
        for transaction in completedTransactions{
            if(Int(Date().timeIntervalSince1970) - Int(isoDateFormatter.date(from: transaction.date)!.timeIntervalSince1970) < monthTimeInterval){
                answer.append(transaction)
            }
        }
        return answer.map {
            return Double($0.account)
        }
    }

    func getYearAccounts() -> [Double] {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds
        ]
        let yearTimeInterval = 365*24*60*60
        var answer : [CompletedTransaction] = []
        for transaction in completedTransactions{
            if(Int(Date().timeIntervalSince1970) - Int(isoDateFormatter.date(from: transaction.date)!.timeIntervalSince1970) < yearTimeInterval){
                answer.append(transaction)
            }
        }
        return answer.map {
            return Double($0.account)
        }
    }

    func getProfit() -> Int {
        var answer = 0
        for transaction in completedTransactions{
            answer += transaction.profit
        }
        return answer
    }

    func getDayProfit() -> Int {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds
        ]
        let dayTimeInterval = 24*60*60
        var answer = 0
        for transaction in completedTransactions{
            if(Int(Date().timeIntervalSince1970) - Int(isoDateFormatter.date(from: transaction.date)!.timeIntervalSince1970) < dayTimeInterval){
                answer += transaction.profit
            }
        }
        return answer
    }

    func getWeekProfit() -> Int{
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds
        ]
        let weekTimeInterval = 7*24*60*60
        var answer = 0
        for transaction in completedTransactions{
            if(Int(Date().timeIntervalSince1970) - Int(isoDateFormatter.date(from: transaction.date)!.timeIntervalSince1970) < weekTimeInterval){
                answer += transaction.profit
            }
        }
        return answer
    }

    func getMonthProfit() -> Int {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds
        ]
        let monthTimeInterval = 31*24*60*60
        var answer = 0
        for transaction in completedTransactions{
            if(Int(Date().timeIntervalSince1970) - Int(isoDateFormatter.date(from: transaction.date)!.timeIntervalSince1970) < monthTimeInterval){
                answer += transaction.profit
            }
        }
        return answer
    }

    func getYearProfit() -> Int {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds
        ]
        let yearTimeInterval = 365*24*60*60
        var answer = 0
        for transaction in completedTransactions{
            if(Int(Date().timeIntervalSince1970) - Int(isoDateFormatter.date(from: transaction.date)!.timeIntervalSince1970) < yearTimeInterval){
                answer += transaction.profit
            }
        }
        return answer
    }
}
