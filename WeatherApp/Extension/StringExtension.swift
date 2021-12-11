//
//  StringExtension.swift
//  VestiaireCollectionTest
//
//  Created by Pallavi on 29/11/21.
//

import Foundation
extension String {
    func measurmentFormatter(temp:Double) -> String {
        
        let measureFormatter = MeasurementFormatter()
        measureFormatter.unitStyle = .short
        measureFormatter.numberFormatter.maximumFractionDigits = 0
        measureFormatter.unitOptions = .providedUnit
        let measurement = Measurement(value: temp, unit: UnitTemperature.celsius)
        let output = measureFormatter.string(from: measurement)
        return output
    }
    
    func getdayFromDt(dt:Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.doesRelativeDateFormatting = true
        print(dateFormatter.string(from: date))
        return dateFormatter.string(from: date)
    }
}
