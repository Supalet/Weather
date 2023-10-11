//
//  PopupAlertViewController.swift
//  Weather
//
//  Created by Supalert Kamolsin on 4/10/2566 BE.
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

// MARK: - UI
struct PopupAlertView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = PopupAlertViewModel()
    
    @Binding var presentAlert: Bool
    
    @State var titleMessage: String? = nil
    @State var detailMessage: String = ""
    @State var leftTitleButton: String = "OK"
    @State var rightTitleButton: String = ""
    
    var leftButtonAction: (() -> ())?
    var rightButtonAction: (() -> ())?
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                VStack(spacing: 10) {
                    if titleMessage != nil {
                        Text(titleMessage ?? "")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(height: 25)
                    }
                    
                    Text(detailMessage)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                        .minimumScaleFactor(0.5)
                    
                    Button {
                        leftButtonAction?()
                    } label: {
                        Text(leftTitleButton)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .background(Color.red)
                            .cornerRadius(4)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 8)
            }
            .background(Color.white)
            .frame(width: UIScreen.main.bounds.width - 50, height: 150)
            .cornerRadius(10)
        }
    }
}

// MARK: - Function Call ViewModel
extension PopupAlertView {
    func calculateHeight() -> CGFloat {
        let paddingTop: CGFloat = 16
        let paddingBottom: CGFloat = 8
    
        return paddingTop + paddingBottom
    }
}
