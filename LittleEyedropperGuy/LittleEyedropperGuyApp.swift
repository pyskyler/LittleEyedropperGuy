//
//  LittleEyedropperGuyApp.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/26/26.
//

import SwiftUI

@main
struct LittleEyedropperGuyApp: App {
    @State private var littleGuy = LittleGuy()
    var body: some Scene {
        let panel = LittleGuyPanel(view: {LittleGuyView(littleGuy: littleGuy)}, contentRect: NSRect(origin: CGPoint(x: 600, y: 800), size: CGSize(width: 120, height: 120)), littleGuy: littleGuy)
        
        MenuBarExtra(
            "Little Guy",
            systemImage: "cat"
        ) {
            ContentView(littleGuy: littleGuy, panel: panel)
                .frame(width: 300, height: 180)
            
        }
        .menuBarExtraStyle(.window)
        
    }
}

#Preview {
}
