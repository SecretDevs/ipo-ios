//
// Created by Sviatoslav on 31.03.2021.
//

import Foundation
import SwiftUI

public struct GraphView: View {
    @ObservedObject var data: ChartData
    public var title: String?
    public var legend: String?
    public var style: ChartStyle
    public var darkModeStyle: ChartStyle
    public var valueSpecifier: String
    public var legendSpecifier: String

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var showLegend = false
    @State private var dragLocation: CGPoint = .zero
    @State private var indicatorLocation: CGPoint = .zero
    @State private var closestPoint: CGPoint = .zero
    @State private var opacity: Double = 0
    @State private var currentDataNumber: Double = 0
    @State private var hideHorizontalLines: Bool = false

    public init(data: [Double],
                title: String? = nil,
                legend: String? = nil,
                style: ChartStyle = Styles.lineChartStyleOne,
                valueSpecifier: String? = "%.1f",
                legendSpecifier: String? = "%.2f") {

        self.data = ChartData(points: data, index: 0)
        self.title = title
        self.legend = legend
        self.style = style
        self.valueSpecifier = valueSpecifier!
        self.legendSpecifier = legendSpecifier!
        self.darkModeStyle = style.darkModeStyle != nil ? style.darkModeStyle! : Styles.lineViewDarkMode
    }

    public var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            if (self.title != nil) {
                                Text(self.title!)
                                        .font(.custom(self.style.fontName, fixedSize: 12))
                                        .foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.textColor : self.style.textColor)
                            }
                            Spacer()
                            if (self.legend != nil) {
                                Text(self.legend!)
                                        .font(.custom(self.style.fontName, fixedSize: 18))
                                        .foregroundColor(Color("Green"))
                                        .foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.legendTextColor : self.style.legendTextColor)
                            }
                        }.padding()
                        ZStack {
                            GeometryReader { reader in
                                switch self.data.index{
                                case 0:
                                    Line(data: self.data,
                                            frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 40, height: reader.frame(in: .local).height + 25)),
                                            touchLocation: self.$indicatorLocation,
                                            showIndicator: self.$hideHorizontalLines,
                                            minDataValue: .constant(nil),
                                            maxDataValue: .constant(nil),
                                            lineGradient: self.style.lineGradientColor
                                    )
                                            .offset(x: 30, y: 0)
                                            .onAppear() {
                                                self.showLegend = true
                                                self.indicatorLocation = CGPoint(x: reader.frame(in: .local).width - 40, y: 0)
                                            }
                                            .onDisappear() {
                                                self.showLegend = false
                                            }
                                case 1:
                                    Line(data: self.data,
                                            frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 40, height: reader.frame(in: .local).height + 25)),
                                            touchLocation: self.$indicatorLocation,
                                            showIndicator: self.$hideHorizontalLines,
                                            minDataValue: .constant(nil),
                                            maxDataValue: .constant(nil),
                                            lineGradient: self.style.lineGradientColor
                                    )
                                            .offset(x: 30, y: 0)
                                            .onAppear() {
                                                self.showLegend = true
                                                self.indicatorLocation = CGPoint(x: reader.frame(in: .local).width - 30, y: 0)
                                            }
                                            .onDisappear() {
                                                self.showLegend = false
                                            }
                                case 2:
                                    Line(data: self.data,
                                            frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 40, height: reader.frame(in: .local).height + 25)),
                                            touchLocation: self.$indicatorLocation,
                                            showIndicator: self.$hideHorizontalLines,
                                            minDataValue: .constant(nil),
                                            maxDataValue: .constant(nil),
                                            lineGradient: self.style.lineGradientColor
                                    )
                                            .offset(x: 30, y: 0)
                                            .onAppear() {
                                                self.showLegend = true
                                                self.indicatorLocation = CGPoint(x: reader.frame(in: .local).width - 30, y: 0)
                                            }
                                            .onDisappear() {
                                                self.showLegend = false
                                            }
                                case 3:
                                    Line(data: self.data,
                                            frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 40, height: reader.frame(in: .local).height + 25)),
                                            touchLocation: self.$indicatorLocation,
                                            showIndicator: self.$hideHorizontalLines,
                                            minDataValue: .constant(nil),
                                            maxDataValue: .constant(nil),
                                            lineGradient: self.style.lineGradientColor
                                    )
                                            .offset(x: 30, y: 0)
                                            .onAppear() {
                                                self.showLegend = true
                                                self.indicatorLocation = CGPoint(x: reader.frame(in: .local).width - 30, y: 0)
                                            }
                                            .onDisappear() {
                                                self.showLegend = false
                                            }
                                case 4:
                                    Line(data: self.data,
                                            frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 40, height: reader.frame(in: .local).height + 25)),
                                            touchLocation: self.$indicatorLocation,
                                            showIndicator: self.$hideHorizontalLines,
                                            minDataValue: .constant(nil),
                                            maxDataValue: .constant(nil),
                                            lineGradient: self.style.lineGradientColor
                                    )
                                            .offset(x: 30, y: 0)
                                            .onAppear() {
                                                self.showLegend = true
                                                self.indicatorLocation = CGPoint(x: reader.frame(in: .local).width - 30, y: 0)
                                            }
                                            .onDisappear() {
                                                self.showLegend = false
                                            }
                                default:
                                    Line(data: self.data,
                                            frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 40, height: reader.frame(in: .local).height + 25)),
                                            touchLocation: self.$indicatorLocation,
                                            showIndicator: self.$hideHorizontalLines,
                                            minDataValue: .constant(nil),
                                            maxDataValue: .constant(nil),
                                            lineGradient: self.style.lineGradientColor
                                    )
                                            .offset(x: 30, y: 0)
                                            .onAppear() {
                                                self.showLegend = true
                                                self.indicatorLocation = CGPoint(x: reader.frame(in: .local).width - 30, y: 0)
                                            }
                                            .onDisappear() {
                                                self.showLegend = false
                                            }
                                }
                                //if (self.showLegend) {
                                Legend(data: self.data,
                                        frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 30, height: reader.frame(in: .local).height)),
                                        hideHorizontalLines: self.$hideHorizontalLines,
                                        maxValueTextColor: self.style.accentColor,
                                        maxValueLineColor: self.style.accentColor,
                                        otherValuesTextColor: self.style.legendTextColor,
                                        otherValuesLineColor: self.style.legendTextColor.opacity(0),
                                        fontName: self.style.fontName,
                                        specifier: legendSpecifier)
                                        .transition(.opacity)
                                        .animation(Animation.easeOut(duration: 1).delay(1))
                                        .offset(x: 15, y: 0)
                                //}

                            }
                                    .frame(width: geometry.frame(in: .local).size.width - 40, height: geometry.frame(in: .local).size.height / 3)

                            MagnifierRect(currentNumber: self.$currentDataNumber, valueSpecifier: self.valueSpecifier, height: geometry.frame(in: .local).size.height / 3 + 35)
                                    .opacity(self.opacity)
                                    .offset(x: self.dragLocation.x - geometry.frame(in: .local).size.width / 2, y: 36)
                        }
                                .frame(width: geometry.frame(in: .local).size.width - 40, height: geometry.frame(in: .local).size.height / 3 + 20)
                                .gesture(DragGesture()
                                        .onChanged({ value in
                                            self.dragLocation = value.location
                                            self.indicatorLocation = CGPoint(x: max(value.location.x - 50, 0), y: 32)
                                            self.opacity = 1
                                            self.closestPoint = self.getClosestDataPoint(toPoint: value.location, width: geometry.frame(in: .local).size.width - 30, height: geometry.frame(in: .local).size.height / 3)
                                            self.hideHorizontalLines = true
                                        })
                                        .onEnded({ value in
                                            self.opacity = 0
                                            self.hideHorizontalLines = false
                                        })
                                )
                        GraphToggleButton(graphData: data)
                    }
                            .background(self.colorScheme == .dark ? self.darkModeStyle.backgroundColor : self.style.backgroundColor)
                            .cornerRadius(15)
                            .shadow(color: self.style.dropShadowColor, radius: true ? 8 : 0)
                    TableView()
                        .padding(.top, 20)
                        .padding([.leading, .trailing], 30)

                }.padding()
            }
        }

    }

    func getClosestDataPoint(toPoint: CGPoint, width: CGFloat, height: CGFloat) -> CGPoint {
        let points = self.data.onlyPoints()
        let stepWidth: CGFloat = width / CGFloat(points.count - 1)
        let stepHeight: CGFloat = height / CGFloat(points.max()! + points.min()!)

        let index: Int = Int(floor((toPoint.x - 15) / stepWidth))
        if (index >= 0 && index < points.count) {
            self.currentDataNumber = points[index]
            return CGPoint(x: CGFloat(index) * stepWidth, y: CGFloat(points[index]) * stepHeight)
        }
        return .zero
    }
}

struct LineViewV2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LineView(data: [8, 23, 54, 32, 12, 37, 7, 23, 43], title: "Full chart", style: Styles.lineChartStyleOne)

            LineView(data: [282.502, 284.495, 283.51, 285.019, 285.197, 286.118, 288.737, 288.455, 289.391, 287.691, 285.878, 286.46, 286.252, 284.652, 284.129, 284.188], title: "Full chart", style: Styles.lineChartStyleOne)

        }
    }
}