//
//  MainView.swift
//  ColorMixer
//
//

import SwiftUI

struct MainView: View {
    @StateObject var colorGuesser = ColorGuess()
    
    var body: some View {
        
        ZStack {
            Image("wallpaper")
                .resizable()
            VStack{
                Spacer()
                TitleView().frame(width: 500, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                BoardView().frame(width: 500, height: 400, alignment: .center)
                ButtonView().frame(width: 500, height: 280, alignment: .bottom)
            }.offset(y: -30)
            if colorGuesser.visibleTutorial {
                TutorialView()
            }
            if colorGuesser.visibleGO {
                OverView()
            }
        }
        .environmentObject(colorGuesser)
        .edgesIgnoringSafeArea(.all)
    }
}
