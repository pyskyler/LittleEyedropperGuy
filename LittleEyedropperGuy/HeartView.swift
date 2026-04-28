//
//  HeartView.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 2/19/26.
//

import SwiftUI

struct HeartView: View {
    @Environment(LittleGuy.self) private var littleGuy
    @State var animate: Bool = false
    
    var body: some View {
        Toggle( isOn: $animate ) {
            
            Image(systemName: "heart.fill")
                .foregroundStyle(littleGuy.eyeDropperColor.swiftUiColor)
                .offset(littleGuy.heartAnimation.isRunning ? CGSize(width: 25, height: -45): CGSize(width: 25, height: -25))
            //                        .offset(littleGuy.heartAnimation.offset)
//                .animation(.easeIn, value: littleGuy.heartAnimation.offset)
        }
    }
}

#Preview {
    LittleGuyView()
        .frame(width: 120, height: 120)
}
