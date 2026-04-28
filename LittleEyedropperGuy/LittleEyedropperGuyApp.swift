//
//  LittleEyedropperGuyApp.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/26/26.
//

import SwiftUI

@main
struct LittleEyedropperGuyApp: App {
    
    
    init() {
        RegisterUserDefaults()
    }
    
    var body: some Scene {
        
        MenuBarExtra(
            "Little Guy",
            systemImage: "cat"
        ) { MenuBarExtraView() }
//        .menuBarExtraStyle(.window)
        
        
            
        
    }
}

#Preview {
}
