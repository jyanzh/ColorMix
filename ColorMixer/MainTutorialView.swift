//
//  MainTutorialView.swift
//  ColorMixer
//
//

import SwiftUI

struct MainTutorialView: View {
    
    var body: some View {
        VStack {
            Text("Welcome to ColorQuest!").font(.title).bold()
            Text("The objective of the game is to mix red, green, and blue to get as close as possible to the target color within the time period. The time period varies based on the difficulty level. If you run out of time, you will automatically lose a check and move onto the next randomly generated target color. In order to judge how close your mixture was to the target color, you simply press the 'check' button. You have 5 of these checks before your game is over. If your mixture was close enough to the target color depending on what level you're on (Easy, Medium, Hard), you'll get your check back and get a certain value added to your current score. Otherwise, you lose a check and you'll be given a new target color. In order to start a new game, simply click the 'play' button on the home screen (by default the level is Easy) and to start a new game based on a difficulty level, simply click on one of difficulty buttons. Have fun mixing!"
            ).frame(maxWidth: 360, alignment: .center)
            Spacer()
        }.frame(width: 340, height: 340, alignment: .center)
    }
}
