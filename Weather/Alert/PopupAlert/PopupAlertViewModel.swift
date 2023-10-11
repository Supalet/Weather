//
//  PopupAlertViewModel.swift
//  Weather
//
//  Created by Supalert Kamolsin on 4/10/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI

class PopupAlertViewModel: ObservableObject {
    var inMemoryStore: IPopupAlertInMemoryStore
    
    @Published var item: String = ""
    
    init() {
        self.inMemoryStore = PopupAlertInMemoryStore()
        // เริ่มเข้าหน้า
    }
}
