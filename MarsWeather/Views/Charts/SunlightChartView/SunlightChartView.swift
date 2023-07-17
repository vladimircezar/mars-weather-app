//
//  SunlightChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-06-07.
//

import SwiftUI
import Charts

struct SunlightChartView: View {
    @ObservedObject var vm: SunlightChartViewModel
    
    var body: some View {
        VStack {
            Chart(vm.sunlightData) {
                LineMark(x: .value("Date", $0.date, unit: .day),
                         y: .value("Time", $0.time, unit: .minute))
                .foregroundStyle(by: .value("Type", $0.type.rawValue))
                .interpolationMethod(.catmullRom)
            }
            .frame(height: 300)
            
            Toggle("Sunrise", isOn: vm.isShowingSunrise)
                .foregroundColor(.secondary)
                .disabled(!vm.isShowingSunset.wrappedValue)
            
            Toggle("Sunset", isOn: vm.isShowingSunset)
                .foregroundColor(.secondary)
                .disabled(!vm.isShowingSunrise.wrappedValue)
        }
    }
}

struct SunlightChartView_Previews: PreviewProvider {
    static var previews: some View {
        SunlightChartView(vm: SunlightChartViewModel(
            reports: Array(MockData.getMockWeatherData()[0..<90]),
            isShowingSunrise: .constant(true),
            isShowingSunset: .constant(false))
        )
    }
}
