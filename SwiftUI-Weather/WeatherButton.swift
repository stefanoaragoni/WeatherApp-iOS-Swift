//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Stefano Aragoni on 16/11/23.
//

import Foundation
import SwiftUI

struct WeatherButtonText: View {
    
    var buttonText: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(.buttonBorder)
    }
}
