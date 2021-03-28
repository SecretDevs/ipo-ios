//
// Created by Sviatoslav on 27.03.2021.
//

import Foundation
import SwiftUI

struct TransactionStatusTag: View{
    var status : Status

    var body: some View {
        switch status{
        case Status.OPEN:
            Text("Сделка открыта")
                    .font(.custom("EuclidSquare-Medium",size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Green"))
                    .padding([.leading, .trailing], 15)
                    .padding([.top, .bottom], 5)
                    .background(Color("Green").opacity(0.15))
                    .cornerRadius(50)
        case .CLOSED:
            Text("Сделка закрыта")
                    .font(.custom("EuclidSquare-Medium",size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(Color("DarkGrey"))
                    .padding([.leading, .trailing], 15)
                    .padding([.top, .bottom], 5)
                    .background(Color("DarkGrey").opacity(0.15))
                    .cornerRadius(50)
        case .AVERAGED:
            Text("Сделка усреднена")
                    .font(.custom("EuclidSquare-Medium",size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Orange"))
                    .padding([.leading, .trailing], 15)
                    .padding([.top, .bottom], 5)
                    .background(Color("Orange").opacity(0.15))
                    .cornerRadius(50)
        }

    }
}

struct TransactionStatusTag_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
