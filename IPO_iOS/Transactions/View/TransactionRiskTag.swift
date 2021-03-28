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
                    .fill(Color("HighRiskColor"))
                    .frame(width: 6, height: 6)
            Text("Высокий риск")
                    .font(.custom("EuclidSquare-Medium",size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(Color("AppBlack"))
        case .MIDDLE:
            Circle()
                    .fill(Color("MiddleRiskColor"))
                    .frame(width: 6, height: 6)
            Text("Средний риск")
                    .font(.custom("EuclidSquare-Medium",size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(Color("AppBlack"))
        case .LOW:
            TriangleDown()
                    .fill(Color("LowRiskColor"))
                    .frame(width: 6, height: 6)
            Text("Низкий риск")
                    .font(.custom("EuclidSquare-Medium",size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(Color("AppBlack"))
        }

    }
}

struct TransactionRiskTag_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}