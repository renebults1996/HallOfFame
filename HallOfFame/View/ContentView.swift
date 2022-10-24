//
//  ContentView.swift
//  HallOfFame
//
//  Created by Rene Bults on 12/10/2022.
//

import SwiftUI

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

struct FlatSignUpView: View {
    @State var email = ""
    @State var amount: Double = 0

    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack {
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
                    
                    Text("Amount you will donate: \(amount, specifier: "%.1f")")
                        .modifier(FlatGlassView())
                    
                    Slider(value: $amount, in: 0...100)
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
            .frame(maxWidth: 320)
            .padding()
            .background(.ultraThinMaterial)
            .foregroundColor(Color.primary.opacity(0.80))
            .foregroundStyle(.ultraThinMaterial)
            .cornerRadius(35)
            .padding()
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
    @EnvironmentObject var sheetManager: SheetManager
    

    var body: some View {
        Button() {
            withAnimation {
                sheetManager.present()
            }
    
        } label: {
            Text("Show display")
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
                .padding(.vertical, 20)
                .padding(.horizontal, 40)
                .background(Color.black.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            
        }
    }
}

struct PopupView: View {
    @State var amount: Double = 0
    let didClose: () -> Void
    var body: some View {
        VStack(spacing: .zero) {
            icon
            title
            VStack(spacing: 12) {
                Text("Amount you will donate: $\(amount, specifier: "%.2f")")
                    .modifier(FlatGlassView())
                Slider(value: $amount, in: 0...100)
                    .modifier(FlatGlassView())
            }

            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .padding(.vertical, 100)
        .multilineTextAlignment(.center)
        .overlay(alignment: .topTrailing) {
            close
        }
        .transition(.move(edge: .bottom))
        .background(.ultraThinMaterial)
        .foregroundColor(Color.primary.opacity(0.80))
        .foregroundStyle(.ultraThinMaterial)
    }
}

private extension PopupView {
    var background: some View {
        RoundedCorners(color: .white, tl: 10, tr: 10, bl: 0, br: 0)
            .shadow(color: .black.opacity(0.2),
                radius: 3)
    }
}

private extension PopupView {
    
    var close: some View {
        Button {
            didClose()
            
        } label: {
            Image(systemName: "xmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 35, weight: .bold, design: .rounded)
                )
                .foregroundColor(.gray.opacity(0.4))
                .padding(8)
        }
    }

    
    var icon: some View {
        Image(systemName: "info")
            .symbolVariant(.circle.fill)
            .font(.system(size: 50, weight: .bold, design: .rounded)
            )
            .foregroundStyle(.blue)
    }
    
    var title: some View {
        Text("Please select donation")
            .font(.system(size: 30, weight: .bold, design: .rounded)
            )
            .padding()
    }
    
    
    
}


struct ContentView: View {
    @EnvironmentObject var sheetManager: SheetManager
    var body: some View {
        ZStack {
            BackgroundView()
                .border(.green)
                .onTapGesture {
                    withAnimation {
                        sheetManager.dismiss()
                    }
                }

            ShowWindowButton()
                .border(.green)
        }
        .overlay(alignment: .bottom) {
            if sheetManager.action.isPressed {
                PopupView {
                    withAnimation {
                        sheetManager.dismiss()
                    }
                }
            }
            
                
        }
        .ignoresSafeArea()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SheetManager())
    }
}



struct RoundedCorners: View {
    var color: Color = .blue
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height

                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}
