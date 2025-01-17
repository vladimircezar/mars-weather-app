//
//  TemperatureView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-01.
//

import SwiftUI

struct TemperatureView: View {
    let report: WeatherReport
    
    var body: some View {
        HStack {
            if UIDevice.isIPad {
                Spacer()
            }
            
            VStack(spacing: 7) {
                Text("Max")
                    .fontWeight(.semibold)

                WeatherIconView(systemName: "thermometer.high")
                
                Text("\(report.maxTemp) °C")
            }
            
            Spacer()
            
            VStack(spacing: 7) {
                Text("Min")
                    .fontWeight(.semibold)
                
                WeatherIconView(systemName: "thermometer.low")
                
                Text("\(report.minTemp) °C")
            }
            
            if UIDevice.isIPad {
                Spacer()
            }
        }
        .padding()
        .frame(height: 120)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(5)
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(report: MockData.report)
    }
}
