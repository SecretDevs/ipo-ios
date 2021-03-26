//
// Created by Илья Разработчик on 08.03.2021.
//

import Foundation
import SwiftUI

struct BottomNavBar: View {
    @StateObject var viewRouter : ViewRouter;


    var body: some View {

            HStack() {

                Button(action: {
                    viewRouter.index = 0
                }) {
                            if viewRouter.index != 0 {

                                VStack {

                                    VStack {

                                        Image("transactions").resizable().renderingMode(.template)
                                                .frame(width: 17.99, height: 17.54).foregroundColor(Color("DarkGrey"))

                                    }.frame(width: 20, height: 20)

                                    Text("Сделки").font(.system(size: 11)).foregroundColor(Color("DarkGrey")).padding(.top, 5)

                                }
                            } else {

                                VStack {

                                    VStack {

                                        Image("transactions").resizable().renderingMode(.template)
                                                .frame(width: 17.99, height: 17.54)
                                                .foregroundColor(Color("ThemeColor"))

                                    }.frame(width: 20, height: 20)

                                    Text("Сделки").font(.system(size: 11)).foregroundColor(Color("ThemeColor")).padding(.top, 5)
                                }
                            }
                }

                Spacer()

                Button(action: {
                    viewRouter.index = 1
                }) {
                    if viewRouter.index != 1 {

                        VStack {

                            VStack {

                                Image("lessons").resizable().renderingMode(.template)
                                        .frame(width: 18, height: 16.5).foregroundColor(Color("DarkGrey"))

                            }.frame(width: 20, height: 20)

                            Text("Курсы").font(.system(size: 11)).foregroundColor(Color("DarkGrey")).padding(.top, 5)

                        }.frame().padding(.leading, 5)

                    } else {

                        VStack {

                            VStack {

                                Image("lessons").resizable().renderingMode(.template)
                                        .frame(width: 18, height: 16.5)
                                        .foregroundColor(Color("ThemeColor"))

                            }.frame(width: 20, height: 20)

                            Text("Курсы").font(.system(size: 11)).foregroundColor(Color("ThemeColor")).padding(.top, 5)
                        }.frame().padding(.leading, 5)
                    }
                }

                Spacer()

                Button(action: {
                    viewRouter.index = 2
                }) {
                    if viewRouter.index != 2 {

                        VStack {

                            VStack {

                                Image("ipo").resizable().renderingMode(.template)
                                        .frame(width: 18, height: 18).foregroundColor(Color("DarkGrey"))

                            }.frame(width: 20, height: 20)

                            Text("IPO").font(.system(size: 11)).foregroundColor(Color("DarkGrey")).padding(.top, 5)

                        }.frame().padding(.leading, 10)
                    } else {

                        VStack {

                            VStack {

                                Image("ipo").resizable().renderingMode(.template)
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(Color("ThemeColor"))

                            }.frame(width: 20, height: 20)

                            Text("IPO").font(.system(size: 11)).foregroundColor(Color("ThemeColor")).padding(.top, 5)
                        }.frame().padding(.leading, 10)
                    }
                }

                Spacer()

                Button(action: {
                    viewRouter.index = 3
                }) {
                    if viewRouter.index != 3 {

                        VStack {

                            VStack {

                                Image("news").resizable().renderingMode(.template)
                                        .frame(width: 15.75, height: 18).foregroundColor(Color("DarkGrey"))

                            }.frame(width: 20, height: 20)

                            Text("Новости").font(.system(size: 11)).foregroundColor(Color("DarkGrey")).padding(.top, 5)

                        }
                    } else {

                        VStack {

                            VStack {

                                Image("news").resizable().renderingMode(.template)
                                        .frame(width: 15.75, height: 18)
                                        .foregroundColor(Color("ThemeColor"))

                            }.frame(width: 20, height: 20)

                            Text("Новости").font(.system(size: 11)).foregroundColor(Color("ThemeColor")).padding(.top, 5)
                        }
                    }
                }

                Spacer()

                Button(action: {
                    viewRouter.index = 4
                }) {
                    if viewRouter.index != 4 {

                        VStack {

                            VStack {

                                Image("account").resizable().renderingMode(.template)
                                        .frame(width: 15.83, height: 18).foregroundColor(Color("DarkGrey"))

                            }.frame(width: 20, height: 20)

                            Text("Аккаунт").font(.system(size: 11)).foregroundColor(Color("DarkGrey")).padding(.top, 5)

                        }
                    } else {

                        VStack {

                            VStack {

                                Image("account").resizable().renderingMode(.template)
                                        .frame(width: 15.83, height: 18)
                                        .foregroundColor(Color("ThemeColor"))

                            }.frame(width: 20, height: 20)

                            Text("Аккаунт").font(.system(size: 11)).foregroundColor(Color("ThemeColor")).padding(.top, 5)
                        }
                    }
                }

            }.frame(height: 45)
                    .padding(.top,17)
                    .padding(.horizontal, 25)
                    .background(Color.white)
        }
}