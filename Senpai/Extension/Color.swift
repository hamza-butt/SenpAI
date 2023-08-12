//
//  Color.swift
//  Senpai
//
//  Created by Hamza Butt on 8/9/23.
//

import UIKit
import SwiftUI

extension Color{
    
    static let LighGrayColor = Color("LighGrayColor")
    static let DarkGrayColor = Color("DarkGrayColor")
    static let BlueColor = Color("BlueColor")
    
}


extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}



