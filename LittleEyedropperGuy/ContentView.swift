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
        let panel = LittleGuyView(view: {
            Image(systemName: "cat")
                .resizable()
                .scaledToFit()
                .padding()
        }, contentRect: NSRect(origin: CGPoint(x: 1200, y: 800), size: CGSize(width: 120, height: 120)), LittleGuyOpen: $LittleGuyOpen)

        VStack {
            Toggle(isOn: $LittleGuyOpen, label: {
                Text("Toggle Little Guy")
            })
            .toggleStyle(.switch)
        }
        .padding(.all, 48)
        .onChange(of: LittleGuyOpen, {
            if LittleGuyOpen {
                panel.orderFront(nil)
                panel.makeKey()
            } else {
                panel.close()
            }
        })
        
    }
}

#Preview {
    ContentView()
}
