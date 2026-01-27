//
//  ContentView.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/26/26.
//

import SwiftUI


struct ContentView: View {
    
    @Bindable var littleGuy: LittleGuy
    var panel: LittleGuyPanel<LittleGuyView>
    
    var body: some View {
        
        VStack {
            Toggle(isOn: $littleGuy.isOpen, label: {
                Text("Toggle Little Guy")
            })
            .toggleStyle(.switch)
        }.onChange(of: littleGuy.isOpen, {
            if littleGuy.isOpen {
                panel.orderFront(nil)
                panel.makeKey()
            } else {
                panel.close()
            }
        })                                                                                                                                                                                 
        
    }
}


