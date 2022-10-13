//
//  ContentView.swift
//  HallOfFame
//
//  Created by Rene Bults on 12/10/2022.
//

import SwiftUI



// create custom button configuration
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct DonatorListView: View {
    var body: some View {
        Text("Example text")
    
    }
}

struct ButtonView: View {
    var body: some View {
        VStack {
            Button("Donate") {
                
            }.buttonStyle(ScaleButtonStyle())
        }
    
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            ButtonView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
