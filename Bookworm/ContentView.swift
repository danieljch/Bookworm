//
//  ContentView.swift
//  Bookworm
//
//  Created by Daniel Jesus Callisaya Hidalgo on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    @State private var rememberMe = false

    var body: some View {
        Toggle("Remember Me", isOn: $rememberMe)
    }
    struct PushButton: View {
        let title: String
        @State var isOn: Bool

        var onColors = [Color.red, Color.yellow]
        var offColors = [Color(white: 0.6), Color(white: 0.4)]

        var body: some View {
            Button(title) {
                isOn.toggle()
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .shadow(radius: isOn ? 0 : 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
