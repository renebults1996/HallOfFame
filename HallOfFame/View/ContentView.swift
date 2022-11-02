//
//  ContentView.swift
//  HallOfFame
//
//  Created by Rene Bults on 12/10/2022.
//

import SwiftUI

struct OfferRow: View {
    let package: Package
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipped()
                    
                VStack(alignment: .leading) {
                    Text(package.title)
                    Text(package.description)
                }
            }
            .padding(5)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Button() {

            
                } label: {
                    Text("\(package.price)")
                        .padding(10)
                        .font(.system(size: 12, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                        .background(Color.orange.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                }.buttonStyle(PlainButtonStyle())
                    
            }
        }
    }
}


struct IntroText: View {
    @State private var showing = false
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                VStack {
                    Text("Welcome!")
                        .padding()
                        .font(.system(size: 24).bold())
                    
                    Text("If you choose to donate any amount, you will be privileged to enter the hall of fame, where you will be until eternity.")
                        .padding()

                    ShowWindowButton()
                        .padding()
                }
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                .padding(.trailing, 10)
                .padding(.leading, 10)
                .padding(.bottom, 0)
                .frame(maxHeight: .infinity)
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
    @EnvironmentObject var setting: ShowSetting
    var body: some View {
        Button() {
            setting.setShowing()
            print(setting.isShowing)
    
        } label: {
            Text("Show donations")
                .font(.system(size: 28, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
                .padding(.vertical, 20)
                .padding(.horizontal, 40)
                .background(Color.orange.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }.popover(isPresented: $setting.isShowing) {
            VStack {
                List(offerList) { package in
                    OfferRow(package: package)
                        .padding()
                        .frame(maxHeight: .infinity)

                        
                }
                
                Button() {

            
                } label: {
                    Text("Enter hall of fame")
                        .font(.system(size: 28, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 40)
                        .background(Color.orange.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }
}
    
struct ContentView: View {
    @StateObject var setting = ShowSetting()
    var body: some View {
        IntroText()
            .environmentObject(setting)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

