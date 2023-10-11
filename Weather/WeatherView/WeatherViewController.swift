//
//  WeatherViewController.swift
//  Weather
//
//  Created by Supalert Kamolsin on 3/10/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

/*
    Tool (つ◉益◉)つ 🗑️
 
    * - PushViewController - *
    NavigationLink(destination: SelectChatecterView(), isActive: $isLogin) { }.hidden()
 
    * - popViewController - *
    presentationMode.wrappedValue.dismiss()
 
 */

import SwiftUI

struct WeatherView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = WeatherViewModel()
    
    @State var presentAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("light_background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack() {
                    HStack {
                        Spacer()
                        
                        Image(systemName: viewModel.weatherImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            
                    }
                    .padding(.horizontal, 16)
                    
                    HStack {
                        Spacer()
                        Text(viewModel.weatherDegree + " °C")
                            .font(.system(size: 38))
                            .bold()
                    }
                    .padding(.horizontal, 32)
                    
                    HStack {
                        Spacer()
                        Text("ThaiLand")
                            .font(.system(size: 24))
                            .bold()
                    }
                    .padding(.horizontal, 32)
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width)
                .padding(.trailing, 20)
                .padding(.top, 20)
            }
        }
        .navigationBarHidden(true)
    }
}
