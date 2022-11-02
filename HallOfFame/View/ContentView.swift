//
//  ContentView.swift
//  HallOfFame
//
//  Created by Rene Bults on 12/10/2022.
//

import SwiftUI

struct OfferRow: View {
    
    var title: String
    var description: String
    var price: Int
    // TODO remove list view and just create a few custom views
    // in VStack. keep them inside of a list though
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "dollarsign.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipped()
                    
                VStack(alignment: .leading) {
                    Text(self.title)
                        .font(.headline)
                    Text(self.description)
                        .font(.caption2)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Button() {

            
                } label: {
                    Text("Get for $\(self.price)")
                        .padding(10)
                        .font(.system(size: 12, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                        .background(Color.orange.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                }.buttonStyle(PlainButtonStyle())
                    
            }
        }
        .padding()
        .frame(maxHeight: .infinity)
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

                    ShowWindowButton(storeManager: StoreManager())
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
    @StateObject var storeManager: StoreManager
    
    var body: some View {
        Button() {
            setting.setShowing()
            print(setting.isShowing)
    
        } label: {
            Text("Show options")
                .font(.system(size: 28, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
                .padding(.vertical, 20)
                .padding(.horizontal, 40)
                .background(Color.orange.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }.popover(isPresented: $setting.isShowing) {
            VStack {
                NavigationView {
                    List(storeManager.myProducts, id: \.self) { product in
                        OfferRow(title: "Small donation", description: "This is the smallest of all packages", price: 10)
                        OfferRow(title: "Medium donation", description: "This package is a bit larger", price: 20)
                        OfferRow(title: "Large donation", description: "This is a large package. Be weary.", price: 30)
                            
                    }
                    .navigationTitle("Donation")
                    .toolbar(content: {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    //Restore products already purchased
                                }) {
                                    Text("Restore Purchases ")
                                }
                            }
                        })
 
                }

            }
        }
    }
}
    
struct ContentView: View {
    @StateObject var setting = ShowSetting()
    @StateObject var storeManager: StoreManager
    var body: some View {
        IntroText()
            .environmentObject(setting)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(storeManager: StoreManager())
    }
}

