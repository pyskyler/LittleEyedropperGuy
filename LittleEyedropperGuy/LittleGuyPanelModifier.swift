//
//  FloatingPanelModifier.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/26/26.
//


import SwiftUI
 
/// Add a  ``LittleGuyPanel`` to a view hierarchy
fileprivate struct LittleGuyPanelModifier<PanelContent: View>: ViewModifier {
    /// Determines wheter the panel should be presented or not
    @Binding var isOpen: Bool
 
    /// Determines the starting size of the panel
    var contentRect: CGRect = CGRect(x: 0, y: 0, width: 120, height: 120)
 
    /// Holds the panel content's view closure
    @ViewBuilder let view: () -> PanelContent
 
    /// Stores the panel instance with the same generic type as the view closure
    @State var panel: LittleGuyPanel<PanelContent>?
 
    func body(content: Content) -> some View {
        content
            .onAppear {
                /// When the view appears, create, center and present the panel if ordered
                panel = LittleGuyPanel(view: view, contentRect: contentRect, isOpen: $isOpen)
                panel?.center()
                if isOpen {
                    present()
                }
//            }.onDisappear {
//                /// When the view disappears, close and kill the panel
//                panel?.close()
//                panel = nil
            }.onChange(of: isOpen, {
                /// On change of the presentation state, make the panel react accordingly
                if isOpen {
                    present()
                } else {
                    panel?.close()
                }
            })
    }
 
    /// Present the panel and make it the key window
    func present() {
        panel?.orderFront(nil)
        panel?.makeKey()
    }
}

extension View {
    /** Present a ``LittleGuyPanel`` in SwiftUI fashion
     - Parameter isPresented: A boolean binding that keeps track of the panel's presentation state
     - Parameter contentRect: The initial content frame of the window
     - Parameter content: The displayed content
     **/
    func LittleGuyPanel<Content: View>(isPresented: Binding<Bool>,
                                      contentRect: CGRect = CGRect(x: 0, y: 0, width: 120, height: 120),
                                      @ViewBuilder content: @escaping () -> Content) -> some View {
        self.modifier(LittleGuyPanelModifier(isOpen: isPresented, contentRect: contentRect, view: content))
    }
}
