//
//  ContentView.swift
//  HallOfFame
//
//  Created by Rene Bults on 12/10/2022.
//

import SwiftUI


struct FlatSignUpView: View {
    @State var email = ""
    @State var password = ""
    @State var passwordAgain = ""
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack{
                Text("Donation")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .padding(.top)
                    .foregroundColor(Color.primary.opacity(0.70))
                
                Text("Donate to a good cause")
                    .font(.callout)
                    .frame(maxWidth : .infinity, alignment: .leading)
                
                Divider().padding()
                
                VStack (spacing: 12) {
                    
                    TextField("Enter username", text: $email)
                        .modifier(FlatGlassView())
                    
                    TextField("Enter email", text: $email)
                        .modifier(FlatGlassView())
                    
                }
                .padding()
                
                Divider().padding()
                

                
                Button {
                    //TODO:- add action
                } label: {
                    ZStack {
                        Text("Donate")
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(.thickMaterial)
                            .cornerRadius(14)
                            .padding(.bottom, 8)
                    }
                }
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .foregroundColor(Color.primary.opacity(0.80))
            .foregroundStyle(.ultraThinMaterial)
            .cornerRadius(35)
            .padding()
        } else {
            // Fallback on earlier versions
            VStack {
                
            }
        }
    }
}

struct FlatGlassView : ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .padding()
                .frame(height: 50)
                .background(.ultraThinMaterial)
                .cornerRadius(14)
        } else {
            // Fallback on earlier versions
            content
                .padding()
                .frame(height: 50)
                .cornerRadius(14)
        }
    }
}

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
        
        ZStack {
            Image("kyogre_wallpaper")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                ButtonView()
                FlatSignUpView()
            }
            
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
