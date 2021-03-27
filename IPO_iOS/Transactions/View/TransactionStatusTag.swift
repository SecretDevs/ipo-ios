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
                    .font(.system(size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(Color("OpenTransactionTextColor"))
                    .padding([.leading, .trailing], 15)
                    .padding([.top, .bottom], 5)
                    .background(Color("OpenTransactionBackgroundColor"))
                    .cornerRadius(50)
        case .CLOSED:
            Text("Сделка закрыта")
                    .font(.system(size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(Color("ClosedTransactionTextColor"))
                    .padding([.leading, .trailing], 15)
                    .padding([.top, .bottom], 5)
                    .background(Color("ClosedTransactionBackgroundColor"))
                    .cornerRadius(50)
        case .AVERAGED:
            Text("Сделка усреднена")
                    .font(.system(size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(Color("AveragedTransactionTextColor"))
                    .padding([.leading, .trailing], 15)
                    .padding([.top, .bottom], 5)
                    .background(Color("AveragedTransactionBackgroundColor"))
                    .cornerRadius(50)
        }

    }
}

struct TransactionStatusTag_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
