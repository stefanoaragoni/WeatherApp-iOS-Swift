//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Stefano Aragoni on 15/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            
            VStack {
                
                CityTextView(cityName: "Guatemala City, Guatemala")
                
                MainWeatherStatus(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                  temperature: isNight ? 14 : 19)
                
                HStack (spacing: 20){
                    
                    WeatherDayView(dayOfWeek: "MON", 
                                   imageName: "cloud.sun.fill",
                                   temperature: 22)
                    WeatherDayView(dayOfWeek: "TUE", 
                                   imageName: "sun.max.fill",
                                   temperature: 28)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.rain.fill",
                                   temperature: 16)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.sun.fill",
                                   temperature: 21)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sun.max.fill",
                                   temperature: 25)
                }
                
                
                Spacer()
                
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButtonText(buttonText: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                
                Spacer()
                
                
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)               // Allows the image to have the default colors
                .resizable()                            // Makes de image bigger; fits the whole screen
                .aspectRatio(contentMode: .fit)         // Makes the image have its original aspect ratio
                .frame(width: 40, height: 40)         // Limits the size of the image
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
    
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatus: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)               // Allows the image to have the default colors
                .resizable()                            // Makes de image bigger; fits the whole screen
                .aspectRatio(contentMode: .fit)         // Makes the image have its original aspect ratio
                .frame(width: 180, height: 180)         // Limits the size of the image
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
