//
//  MenuBarExtraView.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 2/12/26.
//

import SwiftUI


struct MenuBarExtraView: View {
    
    @AppStorage("useRgb") var useRgb: Bool = true
    @AppStorage("useHexPound") var useHexPound: Bool = true
    @AppStorage("useHexUpper") var useHexUpper: Bool = true
//    @Environment(LittleGuy.self) private var littleGuy
    @State private var littleGuy = LittleGuy()
    
    var panel: LittleGuyPanel = LittleGuyPanel(view: {LittleGuyView().environmentObject(littleGuy)}, contentRect: NSRect(origin: CGPoint(x: 600, y: 800), size: CGSize(width: 120, height: 120)))
    
    var body: some View {
        @Bindable var littleGuy = littleGuy

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
        
        Button(action: littleGuy.copyLastSelectedColor) {
            Text("Copy Last Selected Color")
        }
        

        Menu("Color Format") {
            Picker("", selection: $useRgb) {
                Text("RGB (255, 255, 255)").tag(true)
                Text("Hex (\(littleGuy.hexFormatting))").tag(false)
            }.labelsHidden()
            
            
            if (!useRgb) {
                Picker("Upper/Lowercase", selection: $useHexUpper) {
                    Text("Uppercase").tag(true)
                    Text("Lowercase").tag(false)
                }
                Picker("Use # Symbol", selection: $useHexPound) {
                    Text("Yes").tag(true)
                    Text("No").tag(false)
                }
            }
        }.pickerStyle(.inline)

            

        Divider()
        Button("Quit") {
            NSApplication.shared.terminate(nil)
        }.keyboardShortcut("q")
        
    }
}


