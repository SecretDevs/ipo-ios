//
// Created by JelliedFish on 28.03.2021.
//

import Foundation
import SwiftUI

struct ToggleButtonsView: View {

    @StateObject var viewRouter : ViewRouterTransactions;

    var body: some View {
        ZStack {
            HStack {

                HStack {

                    Button(action: {

                        viewRouter.index = 0;

                    }) {
                        if viewRouter.index != 0 {

                            VStack {
                                Image("favorite").resizable().renderingMode(.template)
                                        .frame(width: 16, height: 16).foregroundColor(Color("DarkGrey"))
                            }.frame(width: 45, height: 45)

                        } else {

                            VStack {
                                Image("favorite").resizable().renderingMode(.template)
                                        .frame(width: 16, height: 16).foregroundColor(Color("Orange"))
                            }.frame(width: 45, height: 45).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10))

                        }

                    }

                    Spacer()

                    Button(action: {

                        viewRouter.index = 1;

                    }) {

                        if viewRouter.index != 1 {

                            VStack {

                                Text("IPO").font(.system(size: 13)).foregroundColor(Color.black)

                            }.frame(width: 75, height: 45)
                        } else {

                            VStack {

                                Text("IPO").font(.system(size: 13)).foregroundColor(Color("ThemeColor"))

                            }.frame(width: 75, height: 45)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }

                    Spacer()

                    Button(action: {

                        viewRouter.index = 2;

                    }) {

                        if viewRouter.index != 2 {

                            VStack {

                                Text("SPAC").font(.system(size: 13)).foregroundColor(Color.black)

                            }.frame(width: 75, height: 45)
                        } else {

                            VStack {

                                Text("SPAC").font(.system(size: 13)).foregroundColor(Color("ThemeColor"))

                            }.frame(width: 75, height: 45)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))

                        }
                    }

                    Spacer()

                    Button(action: {

                        viewRouter.index = 3;

                    }) {

                        if viewRouter.index != 3 {

                            VStack {
                                HStack {
                                    Image("lock").resizable().renderingMode(.template)
                                            .frame(width: 10.91, height: 14).foregroundColor(Color("DarkGrey"))
                                    Text("Акции").font(.system(size: 11)).foregroundColor(Color("DarkGrey"))
                                }
                            }.frame(width: 100, height: 45)
                                    .background(Color("Grey"))
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                        } else {

                            VStack {
                                HStack {
                                    Text("Акции").font(.system(size: 11)).foregroundColor(Color("ThemeColor"))
                                }
                            }.frame(width: 100, height: 45)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))

                        }
                    }

                }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)


            }.background(Color("Grey-2"))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
        }
    }
}

struct ToggleButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
