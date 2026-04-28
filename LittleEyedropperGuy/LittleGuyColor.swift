//
//  LittleGuyColor.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 2/15/26.
//

import Foundation
import AppKit
import SwiftUI

struct LittleGuyColor {
    
    var swiftUiColor: Color
    var nsColor: NSColor
    let redInt: Int
    let greenInt: Int
    let blueInt: Int
    
    
    //TODO add getters for the strings
    
    
    init(colorIn: NSColor?) {
        
        nsColor = colorIn ?? .black
        
        swiftUiColor = Color(nsColor: nsColor)
        
        let rgbColor:NSColor = NSColor(swiftUiColor).usingColorSpace(NSColorSpace.deviceRGB) ?? .black
        
        let red = rgbColor.redComponent * 255
        redInt = Int(red.rounded())
        let green = rgbColor.greenComponent * 255
        greenInt = Int(green.rounded())
        let blue = rgbColor.blueComponent * 255
        blueInt = Int(blue.rounded())

    }
    
    func getString(useRGB: Bool, useHexUpper: Bool = true, useHexPound: Bool = true) -> String {
        switch useRGB {
        case true:
            return String(format: "%3.d, %3.d, %3.d", redInt, greenInt, blueInt)
        default:
            var output = ""
            if useHexPound {
                output += "#"
            }
            
            output += String(format: "%02x%02x%02x", redInt, greenInt, blueInt)
            
            if useHexUpper {
                output = output.uppercased()
            }
            
            return output
        }
    }
        
    func getString() -> String {
        
        return self.getString(useRGB: UserDefaults.standard.bool(forKey: "useRgb"), useHexUpper: UserDefaults.standard.bool(forKey: "useHexUpper"), useHexPound: UserDefaults.standard.bool(forKey: "useHexPound"))
    }
}
