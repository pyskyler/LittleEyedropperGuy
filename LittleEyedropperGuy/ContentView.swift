//
//  ContentView.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/26/26.
//

import SwiftUI


struct ContentView: View {
    @State private var LittleGuyOpen: Bool = false
    
    var body: some View {
        
        VStack {
            Toggle(isOn: $LittleGuyOpen, label: {
                Text("Toggle Little Guy")
            })
            .toggleStyle(.switch)
        }.LittleGuyPanel(isPresented: $LittleGuyOpen, content: {LittleGuyView()})
        
    }
}

#Preview {
    ContentView()
}
