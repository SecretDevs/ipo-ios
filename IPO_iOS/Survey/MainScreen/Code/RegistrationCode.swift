//
// Created by Sviatoslav on 07.04.2021.
//

import Foundation
import SwiftUI

struct PasscodeField: View {

    @StateObject var codeRouter : CodeRouter
    @StateObject var registrationRouter : RegistrationRouter
    @State var pin: String = ""
    @State var isDisabled = false
    @State var state : PinState = PinState.NOT_COMPLETED

    var maxDigits: Int = 4
    var label = "Введите 4-х значный код"
    var rightPin: String = "1234"

    public var body: some View {
        VStack(spacing: 27) {
            Text(label)
                    .font(.custom("EuclidSquare-Regular", fixedSize: 16))
                    .foregroundColor(Color("Black"))
            ZStack {
                pinDots
                backgroundField
            }
            Text("Код был отправлен на номер \(registrationRouter.number)")
                    .font(.custom("EuclidSquare-Regular", fixedSize: 12))
                    .foregroundColor(Color("DarkGrey"))
        }
                .frame(width: 335, height: 210)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.vertical, 5)

    }

    private var pinDots: some View {
        HStack {
            Spacer()
            ForEach(0..<maxDigits) { index in
                Text(self.getSymbol(at: index))
                        .font(.custom("EuclidSquare-Regular", fixedSize: 16))
                        .foregroundColor(Color(state == .NOT_COMPLETED ? "Blue" : (state == .CORRECT ? "Green" : "Red")))
                        .padding(.vertical, 12)
                        .padding(.horizontal, 18)
                        .frame(width: 45, height: 45)
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(state == .NOT_COMPLETED ? (index == self.pin.count ? "Blue" : "Grey-2") : (state == .CORRECT ? "Green" : "Red")), lineWidth: 1))
                Spacer()
            }
        }
    }

    private var backgroundField: some View {
        let boundPin = Binding<String>(get: { self.pin }, set: { newValue in
            self.pin = newValue
            self.submitPin()
        })

        return TextField("", text: boundPin, onCommit: submitPin)
                .accentColor(.clear)
                .foregroundColor(.clear)
                .keyboardType(.numberPad)
                .disabled(isDisabled)

    }

    private func submitPin() {

        if pin.count == maxDigits {
            isDisabled = true
            codeRouter.code = pin
            if (pin == rightPin){
                codeRouter.isRight = true
                state = PinState.CORRECT
            } else {
                codeRouter.isRight = false
                state = PinState.INCORRECT
            }
        }

        // this code is never reached under  normal circumstances. If the user pastes a text with count higher than the
        // max digits, we remove the additional characters and make a recursive call.
        if pin.count > maxDigits {
            pin = String(pin.prefix(maxDigits))
            submitPin()
        }
    }

    private func getSymbol(at index: Int) -> String {
        if index < self.pin.count {
            return self.pin.digits[index].numberString
        }
        return " "
    }
}

extension String {

    var digits: [Int] {
        var result = [Int]()

        for char in self {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }

        return result
    }

}

extension Int {

    var numberString: String {

        guard self < 10 else { return "0" }

        return String(self)
    }
}

enum PinState {
    case NOT_COMPLETED
    case CORRECT
    case INCORRECT
}
