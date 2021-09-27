//
//  TutorialView.swift
//  ColorMixer
//
//

import Foundation
import SwiftUI

struct TutorialView: View {
    @EnvironmentObject var colorGuesser: ColorGuess
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.white))
                .frame(width: 400, height: 635)
                .cornerRadius(30)
                .shadow(radius: 10)
            VStack {
                Text("Welcome to ColorQuest!").font(.title).bold()
                Text("\nThe objective of the game is to mix red, green, and blue to get as close as possible to the target color within the time period. The time period varies based on the difficulty level. If you run out of time, you will automatically lose a check and move onto the next randomly generated target color. In order to judge how close your mixture was to the target color, you simply press the 'check' button. You have 5 of these checks before your game is over. If your mixture was close enough to the target color depending on what level you're on (Easy, Medium, Hard), you'll get your check back and get a certain value added to your current score. Otherwise, you lose a check and you'll be given a new target color. In order to start a new game, simply click the 'play' button on the home screen and to start a new game based on a difficulty level, simply click on one of difficulty buttons. Happy Questing!"
                ).frame(maxWidth: 360, alignment: .center)
            }.frame(width: 500, height: 500, alignment: .center)
            .offset(y: -40)
            ZStack {
                Rectangle()
                    .fill(Color(.red))
                    .frame(width: 360, height: 60)
                    .cornerRadius(20)
                    .onTapGesture {
                        colorGuesser.visibleTutorial = false
                        colorGuesser.newgame()
                    }

                Text("Start Mixing!")
                    .bold()
                    .foregroundColor(.white)
            }.frame(height: 360, alignment: .bottom)
            .offset(y: 120)
        }
    }
}
