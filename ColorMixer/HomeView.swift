//
//  HomeView.swift
//  ColorMixer
//
//

import SwiftUI

struct HomeView: View {
    @State private var pulsing =  false
    @State private var innerPulsing = false
    @State private var middlePulsing = false
    @State private var outerPulsing = false
    @State private var show = true
    
    var body: some View {
        GeometryReader { gp in
            NavigationView {
                
                ZStack {
                    Image("pastel")
                    
                    VStack {
                        Text("Welcome to ColorQuest!")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .bold()
                            .offset(y: -75)
                            .shadow(radius: 5)
                        
                        ZStack {
                            
                            Image("outer")
                                .scaleEffect(self.pulsing ? 2.2 : 1.5, anchor: .center)
                                .animation(Animation.easeOut(duration: 1.25)
                                            .repeatForever(autoreverses: true)
                                            , value: pulsing)
                                .opacity(0.75)
                                .onAppear() {
                                    self.outerPulsing.toggle()
                                }
                            
                            Image("middle")
                                .scaleEffect(self.pulsing ? 1.8 : 1.25, anchor: .center)
                                .animation(Animation.easeOut(duration: 1.25)
                                            .repeatForever(autoreverses: true)
                                            , value: pulsing)
                                .opacity(0.75)
                                .onAppear() {
                                    self.middlePulsing.toggle()
                                }
                            
                            Image("inner")
                                .scaleEffect(self.pulsing ? 1.4 : 1, anchor: .center)
                                .animation(Animation.easeOut(duration: 1.25)
                                            .repeatForever(autoreverses: true)
                                            , value: pulsing)
                                .opacity(0.75)
                                .onAppear() {
                                    self.innerPulsing.toggle()
                                }
                            
                            Image("playsmall")
                                .scaleEffect(self.pulsing ? 1 : 0.75, anchor: .center)
                                .animation(Animation.easeOut(duration: 1.25)
                                            .repeatForever(autoreverses: true)
                                            , value: pulsing)
                                .onAppear() {
                                    self.pulsing.toggle()
                                }
                            
                            NavigationLink(destination: MainView()) {
                                Image("play")
                                    .resizable()
                                    .frame(width: 75, height: 75)
                                    .opacity(0)
                            }
                            
                        }
                            
                    }.offset(y: -50)
                    
                    
                }
                
            }
        }
    }
}
