//
//  ContentView.swift
//  HallOfFame
//
//  Created by Rene Bults on 12/10/2022.
//

import SwiftUI


struct IntroText: View {
    var body: some View {
        
        ZStack {
            BackgroundView()
            VStack {
                VStack {
                    Text("Welcome!")
                        .padding()
                        .font(.system(size: 24).bold())
                    
                    Text("This is a proof-of-concept application. It assumes that a certain percentage of people is crazy enough to send money to a stranger. packages are hiding behind the button.")
                        .padding()

                    ShowWindowButton()
                        .padding()
                }
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                .padding(.trailing, 10)
                .padding(.leading, 10)
                .padding(.bottom, 0)
                .frame(maxHeight: 320)
                
                VStack {
                    HscrollView()
                }
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                .padding(.top, 0)
                .padding(.trailing, 10)
                .padding(.leading, 10)
                
            }
        }
    }
}

struct HscrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(0..<5) {
                    Text("Item \($0)")
                        .foregroundColor(.white)
                        .frame(width: 80, height: 60)
                        .background(.red)
                        .padding()
                }
            }
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        Image("kyogre_wallpaper")
            .resizable()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ShowWindowButton: View {
    var body: some View {
        Button() {

    
        } label: {
            Text("Show packages")
                .font(.system(size: 28, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
                .padding(.vertical, 20)
                .padding(.horizontal, 40)
                .background(Color.orange.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

struct ContentView: View {
    var body: some View {
        IntroText()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntroText()
    }
}

