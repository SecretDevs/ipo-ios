//
// Created by JelliedFish on 08.04.2021.
//

import Foundation
import SwiftUI

class SurveyRouter : ObservableObject {
    @Published var index : Int = 1
    @Published var age : String = ""
    @Published var capital : String = "Менее $10 000"
    @Published var exp : String = "Нет"
    @Published var percents : String = "15%"
    @Published var risk : String = "Меньше 15%"
    @Published var purpose : String = "Выберите вариант..."
    @Published var instruments : [String: Bool]  = [
        "Облигации":false,
        "Акции":false,
        "Фьючерсы":false,
        "Опционы":false,
        "IPO":false,
        "Pre-IPO":false,
        "SPAC":false,
        "Ресурсы":false,
    ]




    func isLess18() -> Bool {

        if (age.isInt){

            if (Int(age) ?? 17 >= 18 ){

                return false
            }
            else {

                return true
            }
        }
        else {

            return true
        }
    }


    func hasChosen() -> Bool {

        if (purpose == "Выберите вариант..."){
            return false
        }
        else {
            return true
        }
    }

    func getInstrumentsStrings() -> [String] {
        var answer : [String] = []
        for instrument in instruments{
            if(instrument.value){
                answer.append(instrument.key)
            }
        }
        return answer
    }
}
