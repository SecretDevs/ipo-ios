//
// Created by Sviatoslav on 27.03.2021.
//

import Foundation
import SwiftUI

struct TransactionRiskTag: View{
    var risk : Risk

    var body: some View {
        switch risk{
        case .HIGH:
            TriangleUp()
                    .fill(Color("Red"))
                    .frame(width: 6, height: 6)
            Text("Высокий риск")
                    .font(.custom("EuclidSquare-Medium",size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Black"))
        case .MIDDLE:
            Circle()
                    .fill(Color("Orange"))
                    .frame(width: 6, height: 6)
            Text("Средний риск")
                    .font(.custom("EuclidSquare-Medium",size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Black"))
        case .LOW:
            TriangleDown()
                    .fill(Color("Green"))
                    .frame(width: 6, height: 6)
            Text("Низкий риск")
                    .font(.custom("EuclidSquare-Medium",size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Black"))
        }

    }
}

struct TransactionRiskTag_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}