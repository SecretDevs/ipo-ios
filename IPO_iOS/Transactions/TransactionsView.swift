//
// Created by Илья Разработчик on 08.03.2021.
//

import Foundation
import SwiftUI
struct TransactionsView: View {


    var body: some View {
        VStack{
            ToggleButtonsView().padding()
            Spacer()
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
