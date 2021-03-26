//
// Created by Илья Разработчик on 07.03.2021.
//

import Foundation
import SwiftUI


struct MainView: View {
    @State var tag = 2

    var body: some View {
        NavigationView{

            VStack{

                Spacer()

                CircleTab()


            }.background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))

        }.navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
