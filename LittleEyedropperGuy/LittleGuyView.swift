//
//  LittleGuyView.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/26/26.
//

import SwiftUI

public struct LittleGuyView: View {
    var littleGuy: LittleGuy
    public var body: some View {

        ZStack {
            Circle()
                .fill(.thinMaterial)
            
            
            littleGuy.image
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .padding()
        }
        .onTapGesture(perform: littleGuy.runBasicAnimation)
        .onHover(perform: littleGuy.checkHoverForAnimation)
    }
        
}

#Preview {
}

