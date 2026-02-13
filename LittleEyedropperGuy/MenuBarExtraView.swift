//
//  MenuBarExtraView.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 2/12/26.
//

import SwiftUI


struct MenuBarExtraView: View {
    
    @Bindable var littleGuy: LittleGuy
    @State private var useRGB = UserDefaults.standard.bool(forKey: "useRGB")
    @State private var useHexUpper = UserDefaults.standard.bool(forKey: "useRGB")
    @State private var useHexLower = UserDefaults.standard.bool(forKey: "useRGB")
    @State private var useHexPound = UserDefaults.standard.bool(forKey: "useRGB")
    
    
    var panel: LittleGuyPanel<LittleGuyView>
    
    var body: some View {

        Toggle(isOn: $littleGuy.isOpen, label: {
            Text("Toggle Little Guy")
        })
        .toggleStyle(.button)
        .onChange(of: littleGuy.isOpen, {
            if littleGuy.isOpen {
                panel.orderFront(nil)
                panel.makeKey()
            } else {
                panel.close()
            }
        })
        
        
        Menu("Color Format") {
            Toggle(isOn: Binding { littleGuy.colorOption == .rgb } set: { littleGuy.colorOption = $0 ? .rgb : .rgb}, label: {
                Text("RGB (255, 255, 255)")
            }).toggleStyle(.button)
                
            Toggle(isOn: Binding { littleGuy.colorOption == .hexUpper } set: { littleGuy.colorOption = $0 ? .hexUpper : .hexUpper}, label: {
                Text("Hex Upper (#FFFFFF)")
            }).toggleStyle(.button)

            
            Toggle(isOn: Binding { littleGuy.colorOption == .hexLower } set: { littleGuy.colorOption = $0 ? .hexLower : .hexLower}, label: {
                Text("Hex Lower (#ffffff)")
            }).toggleStyle(.button)
            
            Divider()
            Toggle(isOn: $useHexPound, label: {
                Text("Include # in hex color")
            }).toggleStyle(.button)
        }
        Divider()
        Button("Quit") {
            NSApplication.shared.terminate(nil)
        }.keyboardShortcut("q")
        
    }
}


