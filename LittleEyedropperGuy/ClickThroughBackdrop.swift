//
//  ClickThroughBackdrop.swift
//  LittleEyedropperGuy
//
//  Created by Skyler Ficklin on 1/28/26.
//

import SwiftUI
extension SwiftUI.View {
    /// Enable the view to receive "first mouse" events.
    ///
    /// "First mouse" is the click into an inactive window that brings it to
    /// the front (activates it) and potentially triggers whatever control was
    /// clicked on. Controls that do support this are "click-through", because
    /// you can click on the inactive window, "through" its activation
    /// process, into the control.
    ///
    /// ## Using Buttons
    /// 
    /// Wrap a button like this to make it respond to first clicks. The first
    /// mouse acceptance of this wrapper makes the button perform its action:
    ///
    /// ```swift
    /// Button { ... } label: { ... }
    ///     .style(.plain) // Style breaks default click-through
    ///     .acceptClickThrough() // Enables click-through again
    /// ```
    ///
    /// > Note: You need to stay somewhat close to the button. You can use 
    ///         an `HStack`/`VStack` that wrap buttons, but not on a stack
    ///         that wraps custom views that contain the button 2+ levels deep.
    ///
    /// ## Using other tap gesture-enabled controls
    /// 
    /// This also propagates "first mouse" tap gestures to interactive
    /// controls that are not buttons:
    /// 
    /// ```swift
    /// VStack {
    ///     ForEach(...) { item in
    ///          CustomViewWithoutButtons(item)
    ///             .acceptClickThrough()
    ///             .onTapGesture { ... }
    ///     }
    /// }
    /// ```
    public func acceptClickThrough() -> some View {
        ClickThroughBackdrop(self)
    }
}

fileprivate struct ClickThroughBackdrop<Content: SwiftUI.View>: NSViewRepresentable {
    final class Backdrop: NSHostingView<Content> {
        override func acceptsFirstMouse(for event: NSEvent?) -> Bool {
            return true
        }
    }

    let content: Content

    init(_ content: Content) {
        self.content = content
    }

    func makeNSView(context: Context) -> Backdrop {
        let backdrop = Backdrop(rootView: content)
        backdrop.translatesAutoresizingMaskIntoConstraints = false
        return backdrop
    }

    func updateNSView(_ nsView: Backdrop, context: Context) {
        nsView.rootView = content
    }
}
