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
            
            littleGuy.imageObject.image
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .padding()
                .onTapGesture(perform: littleGuy.tapped)
            
            Rectangle()
                .fill(.clear)
                .frame(width: 40, height: 60)
                .onHover(perform: littleGuy.checkHoverForAnimation)
            
            Rectangle()
                .fill(.clear)
                .frame(width: 20, height: 10)
                .offset(y:-20)
                .onHover(perform: littleGuy.checkHoverForAnimation)
            
            LittleGuyEyedropperButton(littleGuy: littleGuy)

        }
        
       
        
    }
        
}

#Preview {
    LittleGuyView(littleGuy: LittleGuy())
        .frame(width: 120, height: 120)
}

