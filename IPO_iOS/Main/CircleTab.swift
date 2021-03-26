//
// Created by Илья Разработчик on 08.03.2021.
//

import Foundation
import SwiftUI

struct CircleTab : View {
    @State var index = 0

    var body: some View {


        HStack {

            Button(action: {
                self.index = 0
            }) {
                VStack {
                    VStack {
                        if self.index != 0 {
                            Image("transactions").resizable().frame(width: 25, height: 25).foregroundColor(Color.black.opacity(0.2))
                        } else {
                            Image("transactions").resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(Color("themeColor"))
                                    .padding()
                                    .background(Color("themeColor").opacity(0.3))
                                    .clipShape(Circle())
                        }
                    }.frame(width: 30, height: 30)
                    Text("Сделки").font(.system(size: 11)).foregroundColor(Color.black.opacity(0.7)).padding(.top, 5)
                }
            }

            Spacer(minLength: 15)

            Button(action: {
                self.index = 1
            }) {
                VStack {
                    VStack {
                        if self.index != 1 {
                            Image("lessons").resizable().frame(width: 25, height: 25).foregroundColor(Color.black.opacity(0.2))
                        } else {
                            Image("lessons").resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(Color("themeColor"))
                                    .padding()
                                    .background(Color("themeColor").opacity(0.3))
                                    .clipShape(Circle())
                        }
                    }.frame(width: 30, height: 30)
                    Text("Курсы").font(.system(size: 11)).foregroundColor(Color.black.opacity(0.7)).padding(.top, 5)
                }
            }

            Spacer(minLength: 15)

            Button(action: {

                self.index = 2

            }) {
                VStack {
                    VStack {
                        if self.index != 2 {
                            Image("ipo").resizable().frame(width: 25, height: 25).foregroundColor(Color.black.opacity(0.2))
                        } else {
                            Image("ipo").resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(Color("themeColor"))
                                    .padding()
                                    .background(Color("themeColor").opacity(0.3))
                                    .clipShape(Circle())
                        }
                    }.frame(width: 30, height: 30)
                    Text("IPO").font(.system(size: 11)).foregroundColor(Color.black.opacity(0.7)).padding(.top, 5)
                }
            }

            Spacer(minLength: 15)

            Button(action: {
                self.index = 3

            }) {

                VStack {
                    VStack {
                        if self.index != 3 {
                            Image("news").resizable().frame(width: 22, height: 18).foregroundColor(Color.black.opacity(0.2))
                        } else {
                            Image("news").resizable()
                                    .frame(width: 22, height: 18)
                                    .foregroundColor(Color("themeColor"))
                                    .padding()
                                    .background(Color("themeColor").opacity(0.3))
                                    .clipShape(Circle())
                        }
                    }.frame(width: 30, height: 30)
                    Text("Новости").font(.system(size: 11)).foregroundColor(Color.black.opacity(0.7)).padding(.top, 5)
                }

            }

            Spacer(minLength: 15)

            Button(action: {
                self.index = 4

            }) {

                VStack {
                    VStack {
                        if self.index != 4 {
                            Image("settings").resizable()
                                    .frame(width: 25, height: 25).foregroundColor(Color.black.opacity(0.2))
                        } else {
                            Image("settings").resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(Color("themeColor"))
                                    .padding()
                                    .background(Color("themeColor").opacity(0.3))
                                    .clipShape(Circle())
                        }
                    }.frame(width: 30, height: 30)
                    Text("Настройки").font(.system(size: 11)).foregroundColor(Color.black.opacity(0.7)).padding(.top, 5)
                }
            }
        }.padding(.vertical)
        .padding(.horizontal, 25)
        .background(Color.white)
    }
}