//
//  LittleGuyEyedropperButton.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 2/8/26.
//

import SwiftUI

struct LittleGuyEyedropperButton: View {
    @Environment(LittleGuy.self) private var littleGuy
    
    var body: some View {
        let colorSampler = NSColorSampler()
        Button(action: {
            if !littleGuy.eyeDropperRunning {
                littleGuy.eyeDropperRunning = true
                colorSampler.show(selectionHandler: littleGuy.colorSelectedHandler)
            }}) {
                ZStack {
                    Circle()
                        .fill(littleGuy.eyeDropperColor.swiftUiColor)
                        .frame(width: 49, height: 49)
                    
                    Image("yarn")
                        .resizable()
                        .scaledToFit()
                        .frame(width:50, height: 50)
                        .offset(x:-0.5)
                }
            }.offset(x:70, y: 90)
                .scaleEffect(0.4)
                .buttonStyle(.plain)
    }
}

#Preview {
    LittleGuyEyedropperButton()
}
