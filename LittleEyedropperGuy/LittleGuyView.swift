//
//  LittleGuyView.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/26/26.
//

import SwiftUI

public struct LittleGuyView: View {
    @Environment(LittleGuy.self) private var littleGuy
    
    
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
                .onTapGesture(perform: littleGuy.tapped)
            
            Rectangle()
                .fill(.clear)
                .frame(width: 20, height: 10)
                .offset(y:-20)
                .onHover(perform: littleGuy.checkHoverForAnimation)
                .onTapGesture(perform: littleGuy.tapped)
            
            LittleGuyEyedropperButton()
            
            HeartView()
            
//            if littleGuy.heartAnimation.isRunning {
//                HeartView(littleGuy: littleGuy)
//            }
            
            
                
        }
        
       
        
    }
        
}

#Preview {
    LittleGuyView()
        .frame(width: 120, height: 120)
}

