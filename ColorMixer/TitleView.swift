//
//  TitleView.swift
//  ColorMixer
//
//

import SwiftUI

struct TitleView: View {
    @EnvironmentObject var colorGuesser: ColorGuess
    
    var body: some View {
        VStack {
            HStack {
                Text("Checks: \(colorGuesser.checks)")
                    .foregroundColor(Color.white)
                    .font(.title3)
                Text("Time: \(colorGuesser.timeRemaining)")
                    .foregroundColor(Color.white)
                    .font(.title3)
                    .onReceive(colorGuesser.timer) { _ in
                        if colorGuesser.timeRemaining > 0 {
                            colorGuesser.timeRemaining -= 1
                        }else{
                            colorGuesser.check()
                        }
                    }

            }
            HStack {
                Text("Score: \(colorGuesser.score)")
                    .foregroundColor(Color.white)
                    .font(.title3)
                Text("Target Color:")
                    .foregroundColor(Color.white)
                    .font(.title3)
                Rectangle()
                    .fill(Color(colorGuesser.targetColor))
                    .frame(width: 50, height: 50)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

//struct TitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        TitleView()
//    }
//}
